defmodule Momento.CacheClient do
  @moduledoc """
  Documentation for `Momento.CacheClient`.
  """
  @enforce_keys [:config]
  defstruct [:config]

  @opaque t() :: %{required(:config) => Momento.Configuration.t()}

  @doc """
  Set the value in cache with a given time to live (TTL) seconds.

  ## Examples

      TODO

  """
  @spec set(String.t(), binary, binary, float) :: Task.t()
  def set(cache_name, key, value, ttl_seconds) do
    Task.async(fn ->
      rand = :rand.uniform(2)
      case rand do
        1 -> :success
        2 -> {:error, %{}}
      end
    end)
  end


  @doc """
  Get a value from the cache.

  ## Examples

      TODO

  """
  @spec get(String.t(), binary) :: Task.t()
  def get(cache_name, key) do
    Task.async(fn ->
      rand = :rand.uniform(3)
      case rand do
        1 -> :hit
        2 -> :miss
        3 -> {:error, %{}}
      end
    end)
  end
end
