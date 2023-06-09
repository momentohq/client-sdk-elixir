defmodule Momento.CacheClient do
  require Logger
  alias Momento.Config.Configuration, as: Configuration

  @moduledoc """
  Documentation for `Momento.CacheClient`.
  """
  @enforce_keys [:config]
  defstruct [:config]

  @opaque t() :: %{required(:config) => Configuration.t()}

  @doc """
  Set the value in cache with a given time to live (TTL) seconds.

  ## Examples

      TODO

  """
  @spec set(Momento.CacheClient.t(), String.t(), binary, binary, float) ::
          Momento.Responses.Set.t()
  def set(cache_client, cache_name, key, value, ttl_seconds) do
    time_to_sleep = :rand.uniform(100)
    :timer.sleep(time_to_sleep)
    Logger.info("Completed 'set' for key #{key}")
    rand = :rand.uniform(2)

    case rand do
      1 -> :success
      2 -> {:error, %{}}
    end
  end

  @doc """
  Get a value from the cache.

  ## Examples

      TODO

  """
  @spec get(Momento.CacheClient.t(), String.t(), binary) :: Momento.Responses.Get.t()
  def get(cache_client, cache_name, key) do
    time_to_sleep = :rand.uniform(100)
    :timer.sleep(time_to_sleep)
    Logger.info("Completed 'get' for key #{key}")
    rand = :rand.uniform(3)

    case rand do
      1 -> :hit
      2 -> :miss
      3 -> {:error, %{}}
    end
  end
end
