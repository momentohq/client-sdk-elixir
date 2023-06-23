defmodule Main do
  def main() do
    options = %Momento.Examples.LoadGen.Options{
      show_stats_interval_seconds: 5,
      request_timeout_ms: 15 * 1000,
      cache_item_payload_bytes: 100,
      max_requests_per_second: 100,
      number_of_concurrent_requests: 100,
      total_seconds_to_run: 300
    }

    Momento.Examples.LoadGen.main(options)
  end
end

Main.main()
