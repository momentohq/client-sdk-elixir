require Logger

defmodule Momento.Examples.LoadGen do
  alias Momento.CacheClient
  alias Momento.Configurations
  alias Momento.Auth.CredentialProvider
  alias Momento.Examples.Histogram
  alias Momento.Examples.Counter
  alias Momento.Responses

  defmodule Options do
    @enforce_keys [
      :show_stats_interval_seconds,
      :request_timeout_ms,
      :cache_item_payload_bytes,
      :max_requests_per_second,
      :number_of_concurrent_requests,
      :total_seconds_to_run
    ]
    defstruct [
      :show_stats_interval_seconds,
      :request_timeout_ms,
      :cache_item_payload_bytes,
      :max_requests_per_second,
      :number_of_concurrent_requests,
      :total_seconds_to_run
    ]

    @type t() :: %__MODULE__{
                   show_stats_interval_seconds: number(),
                   request_timeout_ms: number(),
                   cache_item_payload_bytes: number(),
                   max_requests_per_second: number(),
                   number_of_concurrent_requests: number(),
                   total_seconds_to_run: number()
                 }
  end

  defmodule Context do
    @enforce_keys [
      :start_time,
      :read_latencies,
      :write_latencies,
      :global_request_count,
      :global_success_count,
      :global_unavailable_count,
      :global_timeout_count,
      :global_limit_exceeded_count
    ]
    defstruct [
      :start_time,
      :read_latencies,
      :write_latencies,
      :global_request_count,
      :global_success_count,
      :global_unavailable_count,
      :global_timeout_count,
      :global_limit_exceeded_count
    ]

    @type t() :: %__MODULE__{
                   start_time: integer(),
                   read_latencies: Histogram.t(),
                   write_latencies: Histogram.t(),
                   global_request_count: Counter.t(),
                   global_success_count: Counter.t(),
                   global_unavailable_count: Counter.t(),
                   global_timeout_count: Counter.t(),
                   global_limit_exceeded_count: Counter.t()
                 }

    @spec new() :: Context.t()
    def new() do
      %Context{
        start_time: :os.system_time(:milli_seconds),
        read_latencies: Histogram.new(),
        write_latencies: Histogram.new(),
        global_request_count: Counter.new(),
        global_success_count: Counter.new(),
        global_unavailable_count: Counter.new(),
        global_timeout_count: Counter.new(),
        global_limit_exceeded_count: Counter.new()
      }
    end

    @spec stop(context :: t()) :: :void
    def stop(context) do
      Histogram.stop(context.read_latencies)
      Histogram.stop(context.write_latencies)
    end
  end

  @cache_name "elixir-loadgen"

  @spec tps(context :: Context.t(), request_count :: integer()) :: integer()
  defp tps(context, request_count) do
    elapsed_time = :os.system_time(:milli_seconds) - context.start_time
    round(request_count * 1000 / elapsed_time)
  end

  @spec percent_requests(total_requests :: integer(), requests :: integer()) :: float()
  defp percent_requests(total_requests, requests) do
    if total_requests == 0 do
      0
    else
      Float.round(requests / total_requests * 100, 2)
    end
  end

  @spec log_stats(options :: Options.t(), context :: Context.t()) :: :void
  defp log_stats(options, context) do
    global_request_count = Counter.get(context.global_request_count)
    global_success_count = Counter.get(context.global_success_count)
    global_unavailable_count = Counter.get(context.global_unavailable_count)
    global_timeout_count = Counter.get(context.global_timeout_count)
    global_limit_exceeded_count = Counter.get(context.global_limit_exceeded_count)

    Logger.info("""
    Cumulative stats:
          total requests: #{global_request_count} (#{tps(context, global_request_count)} tps, limited to #{options.max_requests_per_second} tps)}
                 success: #{global_success_count} (#{percent_requests(global_request_count, global_success_count)}%)
      server unavailable: #{global_unavailable_count} (#{percent_requests(global_request_count, global_unavailable_count)}%)
                 timeout: #{global_timeout_count} (#{percent_requests(global_request_count, global_timeout_count)}%)
          limit exceeded: #{global_limit_exceeded_count} (#{percent_requests(global_request_count, global_limit_exceeded_count)}%)

    Cumulative write latencies:
    #{Histogram.summary(context.write_latencies)}

    Cumulative read latencies:
    #{Histogram.summary(context.read_latencies)}

    """)
    :void
  end

  @spec continuously_log_stats(options :: Options.t(), context :: Context.t()) :: :void
  defp continuously_log_stats(options, context) do
    interval = options.show_stats_interval_seconds
    Process.sleep(interval * 1000)
    log_stats(options, context)
    continuously_log_stats(options, context)
  end

  @spec execute_request_and_update_context_counts(
          context :: Context.t(),
          request_fn :: fun()
        ) :: :void
  defp execute_request_and_update_context_counts(context, request_fn) do
    response = request_fn.()
    Counter.increment(context.global_request_count)

    case response do
      {:ok, _} ->
        Counter.increment(context.global_success_count)

      :miss ->
        Logger.warn("Cache miss!")
        Counter.increment(context.global_success_count)

      {:error, err} ->
        Logger.warn("Error: #{err}")

        case err.error_code do
          :server_unavailable -> Counter.increment(context.global_unavailable_count)
          :timeout_error -> Counter.increment(context.global_timeout_count)
          :limit_exceeded_error -> Counter.increment(context.global_limit_exceeded_count)
          _ -> raise RuntimeError, "Unsupported error: #{err}"
        end
    end
    :void
  end

  @spec worker_issue_write_and_read(
          context :: Context.t(),
          cache_client :: CacheClient.t(),
          worker_id :: integer(),
          operation_num :: integer(),
          delay_between_requests_millis :: integer(),
          cache_value :: binary()
        ) :: :void
  defp worker_issue_write_and_read(
         context,
         cache_client,
         worker_id,
         operation_num,
         delay_between_requests_millis,
         cache_value
       ) do
    write_start_time = :os.system_time(:milli_seconds)

    execute_request_and_update_context_counts(context, fn ->
      execute_write(context, cache_client, worker_id, operation_num, cache_value)
    end)

    write_duration = :os.system_time(:milli_seconds) - write_start_time
    Histogram.record(context.write_latencies, write_duration)

    if write_duration < delay_between_requests_millis do
      Process.sleep(delay_between_requests_millis - write_duration)
    end

    read_start_time = :os.system_time(:milli_seconds)

    execute_request_and_update_context_counts(context, fn ->
      execute_read(context, cache_client, worker_id, operation_num)
    end)

    read_duration = :os.system_time(:milli_seconds) - read_start_time
    Histogram.record(context.read_latencies, read_duration)

    if read_duration < delay_between_requests_millis do
      Process.sleep(delay_between_requests_millis - read_duration)
    end

    :void
  end

  @spec worker_issue_requests_until(
          context :: Context.t(),
          cache_client :: CacheClient.t(),
          worker_id :: integer(),
          operation_num :: integer(),
          stop_time_millis :: integer(),
          delay_between_requests_millis :: integer(),
          cache_value :: binary()
        ) :: :void
  defp worker_issue_requests_until(
         context,
         cache_client,
         worker_id,
         operation_num,
         stop_time_millis,
         delay_between_requests_millis,
         cache_value
       ) do
    worker_issue_write_and_read(
      context,
      cache_client,
      worker_id,
      operation_num,
      delay_between_requests_millis,
      cache_value
    )

    time = :os.system_time(:milli_seconds)

    if time >= stop_time_millis do
      :void
    else
      worker_issue_requests_until(
        context,
        cache_client,
        worker_id,
        operation_num + 1,
        stop_time_millis,
        delay_between_requests_millis,
        cache_value
      )
    end
  end

  @spec execute_write(
          context :: Context.t(),
          cache_client :: CacheClient.t(),
          worker_id :: integer(),
          operation_num :: integer(),
          cache_value :: binary()
        ) :: Responses.Set.t()
  defp execute_write(_context, cache_client, worker_id, operation_num, cache_value) do
    cache_key = "worker#{worker_id}operation#{operation_num}"
    CacheClient.set(cache_client, @cache_name, cache_key, cache_value)
  end

  @spec execute_read(
          context :: Context.t(),
          cache_client :: CacheClient.t(),
          worker_id :: integer(),
          operation_num :: integer()
        ) :: Responses.Get.t()
  defp execute_read(_context, cache_client, worker_id, operation_num) do
    cache_key = "worker#{worker_id}operation#{operation_num}"
    CacheClient.get(cache_client, @cache_name, cache_key)
  end

  @spec main(options :: Options.t()) :: :void
  def main(options) do
    cache_client =
      CacheClient.create!(
        config: Configurations.Laptop.latest(),
        credential_provider: CredentialProvider.from_env_var!("MOMENTO_AUTH_TOKEN"),
        default_ttl_seconds: 60
      )

    CacheClient.create_cache(cache_client, @cache_name)

    Logger.info("Limiting to #{options.max_requests_per_second} tps")
    Logger.info("Running #{options.number_of_concurrent_requests} concurrent requests")
    Logger.info("Running for #{options.total_seconds_to_run} seconds")

    context = Context.new()
    stop_time_millis = context.start_time + options.total_seconds_to_run * 1000
    cache_value = String.duplicate("x", options.cache_item_payload_bytes)

    # reduce just a bit to give us a little more buffer, to make sure we stay under the target tps
    adjusted_max_rps = options.max_requests_per_second * 0.99

    delay_between_requests_millis =
      ceil(1000.0 * options.number_of_concurrent_requests / adjusted_max_rps)

    worker_tasks =
      Enum.map(Enum.to_list(1..(options.number_of_concurrent_requests + 1)), fn worker_id ->
        Task.async(fn ->
          worker_issue_requests_until(
            context,
            cache_client,
            worker_id,
            1,
            stop_time_millis,
            delay_between_requests_millis,
            cache_value
          )
        end)
      end)

    stats_logger_task = Task.async(fn -> continuously_log_stats(options, context) end)

    Logger.info("Awaiting worker tasks")
    Task.await_many(worker_tasks, :infinity)

    Task.shutdown(stats_logger_task, :brutal_kill)

    Logger.info("Final results:")
    log_stats(options, context)

    Context.stop(context)
  end
end
