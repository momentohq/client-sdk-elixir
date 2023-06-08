defmodule Momento.Examples.Basic do
  @cache_name 'test-cache'

  @spec generate_key(integer) :: String.t()
  def generate_key(i) do
    "key#{i}"
  end

  @spec issue_set(Momento.CacheClient.t(), String.t()) :: {String.t(), Task.t()}
  def issue_set(cache_client, key) do
    IO.puts("Executing a 'set' for key: #{key}")

    {key,
     Task.async(fn -> Momento.CacheClient.set(cache_client, @cache_name, key, "foo", 42.2) end)}
  end

  @spec await_set({String.t(), Task.t()}) :: String.t()
  def await_set({key, set_task}) do
    response = Task.await(set_task)

    case response do
      :success -> IO.puts("'set' successful for key #{key}")
      {:error, error} -> IO.puts("Got an error for key #{key}: #{inspect(error)}")
    end

    key
  end

  @spec issue_get(Momento.CacheClient.t(), String.t()) :: {String.t(), Task.t()}
  def issue_get(cache_client, key) do
    IO.puts("Executing a 'get' for key: #{key}")
    {key, Task.async(fn -> Momento.CacheClient.get(cache_client, @cache_name, key) end)}
  end

  @spec await_get({String.t(), Task.t()}) :: String.t()
  def await_get({key, get_task}) do
    response = Task.await(get_task)

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

set_tasks =
  1..20
  |> Stream.map(&Momento.Examples.Basic.generate_key(&1))
  |> Stream.map(&Momento.Examples.Basic.issue_set(cache_client, &1))
  |> Enum.to_list()

get_tasks =
  set_tasks
  |> Stream.map(&Momento.Examples.Basic.await_set(&1))
  |> Stream.map(&Momento.Examples.Basic.issue_get(cache_client, &1))
  |> Enum.to_list()

# force the completion of the tasks
get_tasks
|> Stream.map(&Momento.Examples.Basic.await_get(&1))
|> Enum.to_list()
