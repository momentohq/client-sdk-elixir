defmodule Momento.CacheClient do
  alias Momento.Auth.CredentialProvider
  alias Momento.Configuration
  alias Momento.Internal.ScsControlClient
  alias Momento.Internal.ScsDataClient

  require Logger

  @moduledoc """
  Client to perform operations against a Momento cache.
  """

  @enforce_keys [
    :config,
    :credential_provider,
    :control_client,
    :data_client
  ]
  defstruct [
    :config,
    :credential_provider,
    :control_client,
    :data_client
  ]

  @opaque t() :: %__MODULE__{
            config: Configuration.t(),
            credential_provider: CredentialProvider.t(),
            control_client: ScsControlClient.t(),
            data_client: ScsDataClient.t()
          }

  @doc """
  Creates a new CacheClient instance.

  ## Parameters

  - `config`: A struct containing all tunable client settings.
  - `credential_provider`: A struct representing the credentials to connect to the server.

  ## Returns

  - A `%Momento.CacheClient{}` struct representing the connected client.
  """
  @spec create_client!(
          config :: Momento.Configuration.t(),
          credential_provider :: CredentialProvider.t()
        ) :: t()
  def create_client!(config, credential_provider) do
    with control_client <- ScsControlClient.create!(credential_provider),
         data_client <- ScsDataClient.create!(credential_provider) do
      %__MODULE__{
        config: config,
        credential_provider: credential_provider,
        control_client: control_client,
        data_client: data_client
      }
    end
  end

  @doc """
  Set the value in cache with a given time to live (TTL) seconds.

  ## Parameters

  - `data_client`: A `%Momento.CacheClient{}` struct representing the connected client.
  - `cache_name`: The name of the cache to store the value in. Must be a string.
  - `key`: The key to store the value under. Must be a binary.
  - `value`: The value to be stored. Must be a binary.
  - `ttl_seconds`: The time-to-live of the cache entry in seconds. Must be positive.

  ## Returns

  - `:success` on a successful set.
  - `{:error, error}` tuple if an error occurs.
  """
  @spec set(
          cache_client :: t(),
          cache_name :: String.t(),
          key :: binary(),
          value :: binary(),
          ttl_seconds :: float()
        ) ::
          Momento.Responses.Set.t()
  def set(cache_client, cache_name, key, value, ttl_seconds) do
    ScsDataClient.set(cache_client.data_client, cache_name, key, value, ttl_seconds)
  end

  @doc """
  Get a value from the cache.

  ## Parameters

  - `data_client`: A `%Momento.CacheClient{}` struct representing the connected client.
  - `cache_name`: The name of the cache to fetch the value from. Must be a string.
  - `key`: The key of the value to fetch. Must be a binary.

  ## Returns

  - `{:hit, value}` tuple if the key exists.
  - `:miss` if the key does not exist.
  - `{:error, error}` tuple if an error occurs.
  """
  @spec get(cache_client :: t(), cache_name :: String.t(), key :: binary) ::
          Momento.Responses.Get.t()
  def get(cache_client, cache_name, key) do
    ScsDataClient.get(cache_client.data_client, cache_name, key)
  end

  @doc """
  Delete a value from the cache.

  ## Parameters

  - `data_client`: A `%Momento.CacheClient{}` struct representing the connected client.
  - `cache_name`: The name of the cache to fetch the value from. Must be a string.
  - `key`: The key of the value to fetch. Must be a binary.

  ## Returns

  - `:success` on a successful deletion.
  - `{:error, error}` tuple if an error occurs.
  """
  @spec delete(cache_client :: t(), cache_name :: String.t(), key :: binary) ::
          Momento.Responses.Get.t()
  def delete(cache_client, cache_name, key) do
    ScsDataClient.delete(cache_client.data_client, cache_name, key)
  end
end
