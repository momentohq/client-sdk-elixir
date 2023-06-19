defmodule Momento.CacheClient do
  alias Momento.Auth.CredentialProvider
  alias Momento.Responses.{CreateCache, DeleteCache, ListCaches, Set, Get, Delete}
  alias Momento.Responses.SortedSet
  alias Momento.Requests.CollectionTtl
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
    :default_ttl_seconds,
    :control_client,
    :data_client
  ]
  defstruct [
    :config,
    :credential_provider,
    :default_ttl_seconds,
    :control_client,
    :data_client
  ]

  @opaque t() :: %__MODULE__{
            config: Configuration.t(),
            credential_provider: CredentialProvider.t(),
            default_ttl_seconds: float(),
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
          credential_provider :: CredentialProvider.t(),
          default_ttl_seconds :: float()
        ) :: t()
  def create!(config, credential_provider, default_ttl_seconds) do
    with control_client <- ScsControlClient.create!(credential_provider),
         data_client <- ScsDataClient.create!(credential_provider) do
      %__MODULE__{
        config: config,
        credential_provider: credential_provider,
        default_ttl_seconds: default_ttl_seconds,
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
  @spec list_caches(client :: t()) :: ListCaches.t()
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
        ) :: CreateCache.t()
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
        ) :: DeleteCache.t()
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
          ttl_seconds :: float() | nil
        ) :: Set.t()
  def set(client, cache_name, key, value, ttl_seconds) do
    ttl = ttl_seconds || client.default_ttl_seconds
    ScsDataClient.set(client.data_client, cache_name, key, value, ttl)
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
  @spec get(client :: t(), cache_name :: String.t(), key :: binary) :: Get.t()
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
  @spec delete(client :: t(), cache_name :: String.t(), key :: binary) :: Delete.t()
  def delete(client, cache_name, key) do
    ScsDataClient.delete(client.data_client, cache_name, key)
  end

  @spec sorted_set_put_element(
          client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          value :: binary(),
          score :: float(),
          collection_ttl :: CollectionTtl.t() | nil
        ) :: SortedSet.PutElement.t()
  def sorted_set_put_element(
        client,
        cache_name,
        sorted_set_name,
        value,
        score,
        collection_ttl \\ nil
      ) do
    ttl = collection_ttl || CollectionTtl.of(client.default_ttl_seconds)

    case ScsDataClient.sorted_set_put_elements(
           client.data_client,
           cache_name,
           sorted_set_name,
           [{value, score}],
           ttl
         ) do
      {:ok, _} -> {:ok, %Momento.Responses.SortedSet.PutElement.Ok{}}
      {:error, error} -> {:error, error}
    end
  end

  @spec sorted_set_put_elements(
          client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          elements :: %{binary() => float()} | [{binary(), float()}],
          collection_ttl :: CollectionTtl.t() | nil
        ) :: SortedSet.PutElements.t()
  def sorted_set_put_elements(
        client,
        cache_name,
        sorted_set_name,
        elements,
        collection_ttl \\ nil
      ) do
    ttl = collection_ttl || CollectionTtl.of(client.default_ttl_seconds)

    ScsDataClient.sorted_set_put_elements(
      client.data_client,
      cache_name,
      sorted_set_name,
      elements,
      ttl
    )
  end

  @spec sorted_set_fetch_by_rank(
          client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          start_rank :: integer() | nil,
          end_rank :: integer() | nil,
          sort_order :: :asc | :desc
        ) :: SortedSet.Fetch.t()
  def sorted_set_fetch_by_rank(
        client,
        cache_name,
        sorted_set_name,
        start_rank \\ nil,
        end_rank \\ nil,
        sort_order \\ :asc
      ) do
    ScsDataClient.sorted_set_fetch_by_rank(
      client.data_client,
      cache_name,
      sorted_set_name,
      start_rank,
      end_rank,
      sort_order
    )
  end
end
