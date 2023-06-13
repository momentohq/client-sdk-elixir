require Logger

defmodule Momento.Examples.Basic do
  @cache_name "test-cache"

  @spec generate_key(integer) :: String.t()
  def generate_key(i) do
    "key#{i}"
  end

  @spec issue_set(Momento.CacheClient.t(), String.t()) :: {String.t(), Task.t()}
  def issue_set(cache_client, key) do
    Logger.info("Executing a 'set' for key: #{key}")

    {key,
     Task.async(fn -> Momento.CacheClient.set(cache_client, @cache_name, key, "foo", 42.2) end)}
  end

  @spec await_set({String.t(), Task.t()}) :: String.t()
  def await_set({key, set_task}) do
    response = Task.await(set_task)

    case response do
      :success -> Logger.info("'set' successful for key #{key}")
      {:error, error} -> Logger.info("Got an error for key #{key}: #{inspect(error)}")
    end

    key
  end

  @spec issue_get(Momento.CacheClient.t(), String.t()) :: {String.t(), Task.t()}
  def issue_get(cache_client, key) do
    Logger.info("Executing a 'get' for key: #{key}")
    {key, Task.async(fn -> Momento.CacheClient.get(cache_client, @cache_name, key) end)}
  end

  @spec await_get({String.t(), Task.t()}) :: String.t()
  def await_get({key, get_task}) do
    response = Task.await(get_task)

    case response do
      {:hit, value} -> Logger.info("'get' resulted in a 'hit' for key #{key}: #{inspect(value)}")
      :miss -> Logger.info("'get' resulted in a 'miss' for key #{key}.")
      {:error, error} -> Logger.info("Got an error for key #{key}: #{inspect(error)}")
    end

    key
  end
end

Logger.info("Hello world")
Logger.info("Hello logging world!")

config = %Momento.Configuration{}
credential_provider = Momento.Auth.CredentialProvider.from_env_var!("MOMENTO_AUTH_TOKEN")
cache_client = Momento.CacheClient.create_client!(config, credential_provider)

1..20
|> Enum.map(&Momento.Examples.Basic.generate_key(&1))
|> Enum.map(&Momento.Examples.Basic.issue_set(cache_client, &1))
|> Enum.map(&Momento.Examples.Basic.await_set(&1))
|> Enum.map(&Momento.Examples.Basic.issue_get(cache_client, &1))
|> Enum.map(&Momento.Examples.Basic.await_get(&1))
