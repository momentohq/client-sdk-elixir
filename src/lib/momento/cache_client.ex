defmodule Momento.CacheClient do
  alias Momento.Auth.CredentialProvider
  alias Momento.Internal.ScsControlClient
  alias Momento.Internal.ScsDataClient
  alias Momento.Config.Configuration, as: Configuration

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
  @spec create!(
          config :: Configuration.t(),
          credential_provider :: CredentialProvider.t()
        ) :: t()
  def create!(config, credential_provider) do
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
  List all caches.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` struct representing the connected client.

  ## Returns

  - `{:ok, %Momento.Responses.ListCaches.Ok{caches: caches}}` on a successful listing.
  - `{:error, error}` tuple if an error occurs.
  """
  @spec list_caches(client :: t()) :: Momento.Responses.ListCaches.t()
  def list_caches(client) do
    ScsControlClient.list_caches(client.control_client)
  end

  @doc """
  Creates a cache if it does not exist.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` struct representing the connected client.
  - `cache_name`: The name of the cache to create. Must be a string.

  ## Returns

  - `{:ok, %Momento.Responses.CreateCache.Ok{}}` on a successful create.
  - `:already_exists` if a cache with the specified name already exists.
  - `{:error, error}` tuple if an error occurs.
  """
  @spec create_cache(
          client :: t(),
          cache_name :: String.t()
        ) :: Momento.Responses.DeleteCache.t()
  def create_cache(client, cache_name) do
    ScsControlClient.create_cache(client.control_client, cache_name)
  end

  @doc """
  Deletes a cache and all items stored in it.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` struct representing the connected client.
  - `cache_name`: The name of the cache to delete. Must be a string.

  ## Returns

  - `{:ok, %Momento.Responses.DeleteCache.Ok{}}` on a successful delete.
  - `{:error, error}` tuple if an error occurs.
  """
  @spec delete_cache(
          client :: t(),
          cache_name :: String.t()
        ) :: Momento.Responses.DeleteCache.t()
  def delete_cache(client, cache_name) do
    ScsControlClient.delete_cache(client.control_client, cache_name)
  end

  @doc """
  Set the value in cache with a given time to live (TTL) seconds.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` struct representing the connected client.
  - `cache_name`: The name of the cache to store the value in. Must be a string.
  - `key`: The key to store the value under. Must be a binary.
  - `value`: The value to be stored. Must be a binary.
  - `ttl_seconds`: The time-to-live of the cache entry in seconds. Must be positive.

  ## Returns

  - `{:ok, %Momento.Responses.Set.Ok{}}` on a successful set.
  - `{:error, error}` tuple if an error occurs.
  """
  @spec set(
          client :: t(),
          cache_name :: String.t(),
          key :: binary(),
          value :: binary(),
          ttl_seconds :: float()
        ) ::
          Momento.Responses.Set.t()
  def set(client, cache_name, key, value, ttl_seconds) do
    ScsDataClient.set(client.data_client, cache_name, key, value, ttl_seconds)
  end

  @doc """
  Get a value from the cache.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` struct representing the connected client.
  - `cache_name`: The name of the cache to fetch the value from. Must be a string.
  - `key`: The key of the value to fetch. Must be a binary.

  ## Returns

  - `{:ok, %Momento.Responses.Get.Hit{value: value}}` tuple if the key exists.
  - `:miss` if the key does not exist.
  - `{:error, error}` tuple if an error occurs.
  """
  @spec get(client :: t(), cache_name :: String.t(), key :: binary) ::
          Momento.Responses.Get.t()
  def get(client, cache_name, key) do
    ScsDataClient.get(client.data_client, cache_name, key)
  end

  @doc """
  Delete a value from the cache.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` struct representing the connected client.
  - `cache_name`: The name of the cache to fetch the value from. Must be a string.
  - `key`: The key of the value to fetch. Must be a binary.

  ## Returns

  - `{:ok, %Momento.Responses.Delete.Ok{}}` on a successful deletion.
  - `{:error, error}` tuple if an error occurs.
  """
  @spec delete(client :: t(), cache_name :: String.t(), key :: binary) ::
          Momento.Responses.Delete.t()
  def delete(client, cache_name, key) do
    ScsDataClient.delete(client.data_client, cache_name, key)
  end
end
