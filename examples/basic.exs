defmodule Momento.Examples.Basic do
  @spec generate_key(integer) :: String.t
  def generate_key(i) do
    "key#{i}"
  end

  @spec execute_set(Momento.CacheClient.t, String.t) :: String.t
  def execute_set(cache_client, key) do
    IO.puts("Executing a 'set' for key: #{key}")
    response = Task.await(Momento.CacheClient.set(cache_client, key, "foo", 42))
    case response do
      :success -> IO.puts("'set' successful for key #{key}")
      {:error, error} -> IO.puts("Got an error for key #{key}: #{inspect(error)}")
    end
    key
  end

  @spec execute_get(Momento.CacheClient.t, String.t) :: String.t
  def execute_get(cache_client, key) do
    IO.puts("Executing a 'get' for key: #{key}")
    response = Task.await(Momento.CacheClient.get(cache_client, key))
    case response do
      :hit -> IO.puts("'get' resulted in a 'hit' for key #{key}: #{inspect(response)}")
      :miss -> IO.puts("'get' resulted in a 'miss' for key #{key}.")
      {:error, error} -> IO.puts("Got an error for key #{key}: #{inspect(response)}")
    end
    key
  end
end

IO.puts("Hello world")

config = %Momento.Configuration{}
cache_client = %Momento.CacheClient{config: config}


1..20
|> Stream.map(&Momento.Examples.Basic.generate_key(&1))
|> Stream.map(&Momento.Examples.Basic.execute_set(cache_client, &1))
|> Stream.map(&Momento.Examples.Basic.execute_get(cache_client, &1))
|> Enum.to_list
