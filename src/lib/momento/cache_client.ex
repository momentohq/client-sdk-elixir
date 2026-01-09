defmodule Momento.CacheClient do
  alias Momento.Auth.CredentialProvider
  alias Momento.Responses.{CreateCache, DeleteCache, ListCaches, Set, Get, Delete}
  alias Momento.Responses.SortedSet
  alias Momento.Requests.CollectionTtl
  alias Momento.Internal.ScsControlClient
  alias Momento.Internal.ScsDataClient
  alias Momento.Config.Configuration, as: Configuration

  require Logger

  @moduledoc ~S"""
  Client to perform operations against a Momento cache.

  A client is created by supplying a configuration, a credential provider, and a default time-to-live:
      config = Momento.Configurations.Laptop.latest()

      credential_provider = Momento.Auth.CredentialProvider.from_env_var_v2!()
      default_ttl_seconds = 60.0
      client = CacheClient.create!(config, credential_provider, default_ttl_seconds)

  The resulting struct maintains the connection and can be given to any of the CacheClient functions to make calls to Momento:
      iex> Momento.CacheClient.set(client, "cache", "key", "value")
      {:ok, %Momento.Responses.Set.Ok{}}

  """

  @typedoc """
  Contains all state necessary to connect to the Momento cache, including its configuration and connections.
  Functions that interact with a cache require it as the first argument.
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
            default_ttl_seconds: number(),
            control_client: ScsControlClient.t(),
            data_client: ScsDataClient.t()
          }

  @doc """
  Create a new CacheClient instance.

  ## Parameters

  - `config`: A `%Momento.Config.Configuration{}` containing all tunable client settings.
  - `credential_provider`: A `%Momento.Auth.CredentialProvider{}` representing the credentials to connect to the server.
  - `default_ttl_seconds`: A number representing the time in seconds that a value added to the cache will persist.
    CacheClient methods that write to a cache can override this value.

  ## Raises

  - An error if the client cannot connect to momento.

  ## Returns

  - `{:ok, %Momento.CacheClient{}}` on a successful client creation.
  - `{:error, any()}` if an error occurs.
  """
  @spec create(
          config :: Configuration.t(),
          credential_provider :: CredentialProvider.t(),
          default_ttl_seconds :: number()
        ) :: {:ok, t()} | {:error, any()}
  def create(config, credential_provider, default_ttl_seconds) do
    with {:ok, control_client} <- ScsControlClient.create(credential_provider),
         {:ok, data_client} <- ScsDataClient.create(credential_provider) do
      {:ok,
       %__MODULE__{
         config: config,
         credential_provider: credential_provider,
         default_ttl_seconds: default_ttl_seconds,
         control_client: control_client,
         data_client: data_client
       }}
    end
  end

  @doc """
  Create a new CacheClient instance.

  ## Parameters

  - `config`: A `%Momento.Config.Configuration{}` containing all tunable client settings.
  - `credential_provider`: A `%Momento.Auth.CredentialProvider{}` representing the credentials to connect to the server.
  - `default_ttl_seconds`: A number representing the time in seconds that a value added to the cache will persist.
    CacheClient methods that write to a cache can override this value.

  ## Raises

  - An error if the client cannot connect to momento.

  ## Returns

  - A `%Momento.CacheClient{}` struct representing the connected client.
  """
  @spec create!(
          config :: Configuration.t(),
          credential_provider :: CredentialProvider.t(),
          default_ttl_seconds :: number()
        ) :: t()
  def create!(config, credential_provider, default_ttl_seconds) do
    result = create(config, credential_provider, default_ttl_seconds)

    case result do
      {:ok, client} -> client
      {:error, e} -> raise e
    end
  end

  @doc """
  List all caches.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.

  ## Returns

  - `{:ok, %Momento.Responses.ListCaches.Ok{caches: caches}}` on a successful listing. It contains:
    - `caches: [%Momento.Responses.CacheInfo{}]`
  - `{:error, error}` if an error occurs.

  ## Examples

      iex> Momento.CacheClient.list_caches(client)
      {:ok,
      %Momento.Responses.ListCaches.Ok{
       caches: [
         %Momento.Responses.CacheInfo{
           name: "cache"
         }
       ]
      }}
  """
  @spec list_caches(client :: t()) :: ListCaches.t()
  def list_caches(client) do
    ScsControlClient.list_caches(client.control_client)
  end

  @doc """
  Create a cache if it does not exist.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache to create. Must be a string.

  ## Returns

  - `{:ok, %Momento.Responses.CreateCache.Ok{}}` on a successful create.
  - `:already_exists` if a cache with the specified name already exists.
  - `{:error, error}` if an error occurs.

  ## Examples

      iex> Momento.CacheClient.create_cache(client, "cache")
      {:ok, %Momento.Responses.CreateCache.Ok{}}

      iex> Momento.CacheClient.create_cache(client, "cache")
      :already_exists
  """
  @spec create_cache(
          client :: t(),
          cache_name :: String.t()
        ) :: CreateCache.t()
  def create_cache(client, cache_name) do
    ScsControlClient.create_cache(client.control_client, cache_name)
  end

  @doc """
  Delete a cache and all items stored in it.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache to delete. Must be a string.

  ## Returns

  - `{:ok, %Momento.Responses.DeleteCache.Ok{}}` on a successful delete.
  - `{:error, error}` if an error occurs, or when deleting a cache that doesn't exist.

  ## Examples

      iex> Momento.CacheClient.delete_cache(client, "cache")
      {:ok, %Momento.Responses.DeleteCache.Ok{}}
  """
  @spec delete_cache(
          client :: t(),
          cache_name :: String.t()
        ) :: DeleteCache.t()
  def delete_cache(client, cache_name) do
    ScsControlClient.delete_cache(client.control_client, cache_name)
  end

  @doc """
  Set a value in a cache. Replaces the existing value if one is present.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache to store the value in. Must be a string.
  - `key`: The key to store the value under. Must be a binary.
  - `value`: The value to be stored. Must be a binary.

  ## Options

  - `ttl_seconds`: The time-to-live of the cache entry in seconds. Must be positive. Defaults to the client TTL.

  ## Returns

  - `{:ok, %Momento.Responses.Set.Ok{}}` on a successful set.
  - `{:error, error}` tuple if an error occurs.

  ## Examples

      iex> Momento.CacheClient.set(client, "cache", "key", "value")
      {:ok, %Momento.Responses.Set.Ok{}}

      iex> Momento.CacheClient.set(client, "cache", "key", "value", ttl_seconds: 600.0)
      {:ok, %Momento.Responses.Set.Ok{}}
  """
  @spec set(
          client :: t(),
          cache_name :: String.t(),
          key :: binary(),
          value :: binary(),
          opts :: [ttl_seconds :: number()]
        ) :: Set.t()
  def set(client, cache_name, key, value, opts \\ []) do
    ttl = Keyword.get(opts, :ttl_seconds, client.default_ttl_seconds)
    ScsDataClient.set(client.data_client, cache_name, key, value, ttl)
  end

  @doc """
  Get a value from a cache.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache to fetch the value from. Must be a string.
  - `key`: The key of the value to fetch. Must be a binary.

  ## Returns

  - `{:ok, %Momento.Responses.Get.Hit{}}` if the key exists. It contains:
    - `value: binary()`
  - `:miss` if the key does not exist.
  - `{:error, error}` if an error occurs.

  ## Examples

      iex> Momento.CacheClient.set(client, "cache", "key", "value")
      {:ok, %Momento.Responses.Set.Ok{}}

      iex> Momento.CacheClient.get(client, "cache", "key")
      {:ok, %Momento.Responses.Get.Hit{value: "value"}}

      iex> Momento.CacheClient.get(client, "cache", "non-existent-key")
      :miss
  """
  @spec get(client :: t(), cache_name :: String.t(), key :: binary) :: Get.t()
  def get(client, cache_name, key) do
    ScsDataClient.get(client.data_client, cache_name, key)
  end

  @doc """
  Delete a value from the cache.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache to delete the value in. Must be a string.
  - `key`: The key to delete. Must be a binary.

  ## Returns

  - `{:ok, %Momento.Responses.Delete.Ok{}}` on a successful deletion.
  - `{:error, error}` if an error occurs.

  ## Examples

      iex> Momento.CacheClient.set(client, "cache", "key", "value")
      {:ok, %Momento.Responses.Set.Ok{}}

      iex> Momento.CacheClient.delete(client, "cache", "key")
      {:ok, %Momento.Responses.Delete.Ok{}}
  """
  @spec delete(client :: t(), cache_name :: String.t(), key :: binary) :: Delete.t()
  def delete(client, cache_name, key) do
    ScsDataClient.delete(client.data_client, cache_name, key)
  end

  @doc """
  Add a value and score to a sorted set. Replaces the existing score if the value is already present.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache containing the sorted set. Must be a string.
  - `sorted_set_name`: The name of the sorted set to store the value in. Must be a string.
  - `value`: The value to be stored. Must be a binary.
  - `score`: The score of the value. Determines the value's position in the sorted set. Must be a number.

  ## Options

  - `collection_ttl`: The TTL for the sorted set in the cache. Defaults to the client TTL.

  ## Returns

  - `{:ok, %Momento.Responses.SortedSet.PutElement.Ok{}}` on a successful put.
  - `{:error, %Momento.Error{}}` if an error occurs.

  ## Examples

      iex> Momento.CacheClient.sorted_set_put_element(client, "cache", "sorted-set", "value", 1.0)
      {:ok, %Momento.Responses.SortedSet.PutElement.Ok{}}

      iex> ttl = Momento.Requests.CollectionTtl.of(60.0)
      %Momento.Requests.CollectionTtl{ttl_seconds: 60.0, refresh_ttl: true}

      iex> Momento.CacheClient.sorted_set_put_element(client, "cache", "sorted-set", "value", 1.0, collection_ttl: ttl)
      {:ok, %Momento.Responses.SortedSet.PutElement.Ok{}}

      iex> ttl = Momento.Requests.CollectionTtl.refresh_ttl_if_provided(nil)
      %Momento.Requests.CollectionTtl{ttl_seconds: nil, refresh_ttl: false}

      iex> Momento.CacheClient.sorted_set_put_element(client, "cache", "sorted-set", "value", 1.0, collection_ttl: ttl)
      {:ok, %Momento.Responses.SortedSet.PutElement.Ok{}}
  """
  @spec sorted_set_put_element(
          client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          value :: binary(),
          score :: number(),
          opts :: [collection_ttl :: CollectionTtl.t()]
        ) :: SortedSet.PutElement.t()
  def sorted_set_put_element(
        client,
        cache_name,
        sorted_set_name,
        value,
        score,
        opts \\ []
      ) do
    collection_ttl =
      Keyword.get(opts, :collection_ttl, CollectionTtl.of(client.default_ttl_seconds))

    case ScsDataClient.sorted_set_put_elements(
           client.data_client,
           cache_name,
           sorted_set_name,
           [{value, score}],
           collection_ttl
         ) do
      {:ok, _} -> {:ok, %Momento.Responses.SortedSet.PutElement.Ok{}}
      {:error, error} -> {:error, error}
    end
  end

  @doc """
  Add the given values and scores to a sorted set. Replaces the existing score for any value already present.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache containing the sorted set. Must be a string.
  - `sorted_set_name`: The name of the sorted set to store the value in. Must be a string.
  - `elements`: The values and scores to be stored. Must be an enum of binary to number.

  ## Options

  - `collection_ttl`: The TTL for the sorted set in the cache. Defaults to the client TTL.

  ## Returns

  - `{:ok, %Momento.Responses.SortedSet.PutElements.Ok{}}` on a successful put.
  - `{:error, %Momento.Error{}}` if an error occurs.

  ## Examples

      iex> Momento.CacheClient.sorted_set_put_elements(client, "cache", "sorted-set", [{"val1", 1.0}, {"val2", 2.0}])
      {:ok, %Momento.Responses.SortedSet.PutElements.Ok{}}

      iex> Momento.CacheClient.sorted_set_put_elements(client, "cache", "sorted-set", %{"val1" => 1.0, "val2" => 2.0})
      {:ok, %Momento.Responses.SortedSet.PutElements.Ok{}}

      iex> ttl = Momento.Requests.CollectionTtl.of(60.0)
      %Momento.Requests.CollectionTtl{ttl_seconds: 60.0, refresh_ttl: true}

      iex> Momento.CacheClient.sorted_set_put_elements(client, "cache", "sorted-set", [{"val1", 1.0}], collection_ttl: ttl)
      {:ok, %Momento.Responses.SortedSet.PutElements.Ok{}}
  """
  @spec sorted_set_put_elements(
          client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          elements :: %{binary() => number()} | [{binary(), number()}],
          opts :: [collection_ttl :: CollectionTtl.t()]
        ) :: SortedSet.PutElements.t()
  def sorted_set_put_elements(
        client,
        cache_name,
        sorted_set_name,
        elements,
        opts \\ []
      ) do
    collection_ttl =
      Keyword.get(opts, :collection_ttl, CollectionTtl.of(client.default_ttl_seconds))

    ScsDataClient.sorted_set_put_elements(
      client.data_client,
      cache_name,
      sorted_set_name,
      elements,
      collection_ttl
    )
  end

  @doc """
  Fetch the values and scores from a sorted set by rank. The returned values are ordered by their scores.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache containing the sorted set. Must be a string.
  - `sorted_set_name`: The name of the sorted set to fetch the values from. Must be a string.

  ## Options

  - `start_rank`: The inclusive 0-indexed rank of the first value. If not provided,
  the fetch starts from the beginning of the set. Must be an integer.
  - `end_rank`: The exclusive 0-indexed rank of the last value. If not provided,
  the fetch goes to the end of the set. Must be an integer.
  - `sort_order`: The order to sort the set before trimming by rank and fetching.
  Defaults to ascending. Must be :asc or :desc.

  ## Returns

  - `{:ok, %Momento.Responses.SortedSet.Fetch.Hit{}}` if the sorted set exists. It contains:
    - `value: [{binary(), float()}]`
  - `:miss` if the sorted set does not exist.
  - `{:error, %Momento.Error{}}` if an error occurs.

  ## Examples

      iex> Momento.CacheClient.sorted_set_put_elements(client, "cache", "sorted-set",
      ...> [{"val1", 1.0}, {"val2", 2.0}, {"val3", 3.0}])
      {:ok, %Momento.Responses.SortedSet.PutElements.Ok{}}

      iex> Momento.CacheClient.sorted_set_fetch_by_rank(client, "cache", "sorted-set")
      {:ok,
      %Momento.Responses.SortedSet.Fetch.Hit{
       value: [{"val1", 1.0}, {"val2", 2.0}, {"val3", 3.0}]
      }}

      iex> Momento.CacheClient.sorted_set_fetch_by_rank(client, "cache", "sorted-set", sort_order: :desc)
      {:ok,
      %Momento.Responses.SortedSet.Fetch.Hit{
       value: [{"val3", 3.0}, {"val2", 2.0}, {"val1", 1.0}]
      }}

      iex> Momento.CacheClient.sorted_set_fetch_by_rank(client, "cache", "sorted-set", start_rank: 1, end_rank: 2)
      {:ok, %Momento.Responses.SortedSet.Fetch.Hit{value: [{"val2", 2.0}]}}

      iex> Momento.CacheClient.sorted_set_fetch_by_rank(client, "cache", "sorted-set", start_rank: 5, end_rank: 10)
      {:ok, %Momento.Responses.SortedSet.Fetch.Hit{value: []}}

      iex> Momento.CacheClient.sorted_set_fetch_by_rank(client, "cache", "empty-sorted-set")
      :miss
  """
  @spec sorted_set_fetch_by_rank(
          client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          opts :: [start_rank: integer(), end_rank: integer(), sort_order: :asc | :desc]
        ) :: SortedSet.Fetch.t()
  def sorted_set_fetch_by_rank(
        client,
        cache_name,
        sorted_set_name,
        opts \\ []
      ) do
    start_rank = Keyword.get(opts, :start_rank)
    end_rank = Keyword.get(opts, :end_rank)
    sort_order = Keyword.get(opts, :sort_order, :asc)

    ScsDataClient.sorted_set_fetch_by_rank(
      client.data_client,
      cache_name,
      sorted_set_name,
      start_rank,
      end_rank,
      sort_order
    )
  end

  @doc """
  Fetch the values and scores from a sorted set by score. The returned values are ordered by their scores.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache containing the sorted set. Must be a string.
  - `sorted_set_name`: The name of the sorted set to fetch the values from. Must be a string.

  ## Options

  - `min_score`: The inclusive minimum score for a fetched value. If not provided,
  the fetch starts from the beginning of the set. Must be a number.
  - `end_rank`: The inclusive maximum score for a fetched value. If not provided,
  the fetch goes to the end of the set. Must be a number.
  - `offset`: The number of elements to skip before returning the first element.
  Must be an integer. Defaults to 0.
  - `count`: The maximum number of elements to return. Must be an integer.
  Defaults to all elements.
  - `sort_order`: The order to sort the set before trimming by rank and fetching.
  Defaults to ascending. Must be :asc or :desc.

  ## Returns

  - `{:ok, %Momento.Responses.SortedSet.Fetch.Hit{}}` if the sorted set exists. It contains:
    - `value: [{binary(), float()}]`
  - `:miss` if the sorted set does not exist.
  - `{:error, %Momento.Error{}}` if an error occurs.

  ## Examples

      iex> Momento.CacheClient.sorted_set_put_elements(client, "cache", "sorted-set",
      ...> [{"val1", 1.0}, {"val2", 2.0}, {"val3", 3.0}])
      {:ok, %Momento.Responses.SortedSet.PutElements.Ok{}}

      iex> Momento.CacheClient.sorted_set_fetch_by_score(client, "cache", "sorted-set")
      {:ok,
      %Momento.Responses.SortedSet.Fetch.Hit{
       value: [{"val1", 1.0}, {"val2", 2.0}, {"val3", 3.0}]
      }}

      iex> Momento.CacheClient.sorted_set_fetch_by_score(client, "cache", "sorted-set", sort_order: :desc)
      {:ok,
      %Momento.Responses.SortedSet.Fetch.Hit{
       value: [{"val3", 3.0}, {"val2", 2.0}, {"val1", 1.0}]
      }}

      iex> Momento.CacheClient.sorted_set_fetch_by_score(client, "cache", "sorted-set", min_score: 1.1, max_score: 3.0)
      {:ok,
      %Momento.Responses.SortedSet.Fetch.Hit{value: [{"val2", 2.0}, {"val3", 3.0}]}}

      iex> Momento.CacheClient.sorted_set_fetch_by_score(client, "cache", "sorted-set", offset: 1, count: 1)
      {:ok, %Momento.Responses.SortedSet.Fetch.Hit{value: [{"val2", 2.0}]}}

      iex> Momento.CacheClient.sorted_set_fetch_by_score(client, "cache", "sorted-set", min_score: 99.9)
      {:ok, %Momento.Responses.SortedSet.Fetch.Hit{value: []}}

      iex> Momento.CacheClient.sorted_set_fetch_by_score(client, "cache", "empty-sorted-set")
      :miss
  """
  @spec sorted_set_fetch_by_score(
          client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          opts :: [
            min_score: number(),
            max_score: number(),
            offset: integer(),
            count: integer(),
            sort_order: :asc | :desc
          ]
        ) :: SortedSet.Fetch.t()
  def sorted_set_fetch_by_score(
        client,
        cache_name,
        sorted_set_name,
        opts \\ []
      ) do
    min_score = Keyword.get(opts, :min_score)
    max_score = Keyword.get(opts, :max_score)
    offset = Keyword.get(opts, :offset)
    count = Keyword.get(opts, :count)
    sort_order = Keyword.get(opts, :sort_order, :asc)

    ScsDataClient.sorted_set_fetch_by_score(
      client.data_client,
      cache_name,
      sorted_set_name,
      min_score,
      max_score,
      offset,
      count,
      sort_order
    )
  end

  @doc """
  Remove an element from a sorted set.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache containing the sorted set. Must be a string.
  - `sorted_set_name`: The name of the sorted set to remove the value from. Must be a string.
  - `value`: The value to be removed. Must be a binary.

  ## Returns

  - `{:ok, %Momento.Responses.SortedSet.RemoveElement.Ok{}}` on a successful put.
  - `{:error, %Momento.Error{}}` if an error occurs.

  ## Examples

      iex> Momento.CacheClient.sorted_set_remove_element(client, "cache", "sorted-set", "value")
      {:ok, %Momento.Responses.SortedSet.RemoveElement.Ok{}}

  """
  @spec sorted_set_remove_element(
          client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          value :: binary()
        ) :: Momento.Responses.SortedSet.RemoveElement.t()
  def sorted_set_remove_element(
        client,
        cache_name,
        sorted_set_name,
        value
      ) do
    case ScsDataClient.sorted_set_remove_elements(
           client.data_client,
           cache_name,
           sorted_set_name,
           [value]
         ) do
      {:ok, _} -> {:ok, %Momento.Responses.SortedSet.RemoveElement.Ok{}}
      {:error, error} -> {:error, error}
    end
  end

  @doc """
  Remove multiple elements from a sorted set.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache containing the sorted set. Must be a string.
  - `sorted_set_name`: The name of the sorted set to remove the values from. Must be a string.
  - `values`: The value to be removed. Must be a list of binaries.

  ## Returns

  - `{:ok, %Momento.Responses.SortedSet.RemoveElements.Ok{}}` on a successful put.
  - `{:error, %Momento.Error{}}` if an error occurs.

  ## Examples

      iex> Momento.CacheClient.sorted_set_remove_elements(client, "cache", "sorted-set", ["value1", "value2"])
      {:ok, %Momento.Responses.SortedSet.RemoveElements.Ok{}}

  """
  @spec sorted_set_remove_elements(
          client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          values :: [binary()]
        ) :: Momento.Responses.SortedSet.RemoveElements.t()
  def sorted_set_remove_elements(
        client,
        cache_name,
        sorted_set_name,
        values
      ) do
    ScsDataClient.sorted_set_remove_elements(
      client.data_client,
      cache_name,
      sorted_set_name,
      values
    )
  end

  @doc """
  Get the rank of a value in a sorted set.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache containing the sorted set. Must be a string.
  - `sorted_set_name`: The name of the sorted set to get the rank from. Must be a string.
  - `value`: The value to check the rank of. Must be a binary.

  ## Options

  - `sort_order`: The order to sort the set before finding the rank of the value.
  Defaults to ascending. Must be :asc or :desc.

  ## Returns

  - `{:ok, %Momento.Responses.SortedSet.GetRank.Hit{}}` if the value exists. It contains:
    - `rank: integer()`
  - `:miss` if the value does not exist.
  - `{:error, error}` if an error occurs.

  ## Examples

      iex> Momento.CacheClient.sorted_set_put_elements(client, "cache", "sorted-set",
      ...> [{"val1", 1.0}, {"val2", 2.0}, {"val3", 3.0}])
      {:ok, %Momento.Responses.SortedSet.PutElements.Ok{}}

      iex> Momento.CacheClient.sorted_set_get_rank(client, "cache", "sorted-set", "val1")
      {:ok, %Momento.Responses.SortedSet.GetRank.Hit{rank: 0}}

      iex> Momento.CacheClient.sorted_set_get_rank(client, "cache", "sorted-set", "val1", sort_order: :desc)
      {:ok, %Momento.Responses.SortedSet.GetRank.Hit{rank: 2}}

      iex> Momento.CacheClient.sorted_set_get_rank(client, "cache", "sorted-set", "non-existent-value")
      :miss
  """
  @spec sorted_set_get_rank(
          client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          value :: binary(),
          opts :: [sort_order: :asc | :desc]
        ) :: Momento.Responses.SortedSet.GetRank.t()
  def sorted_set_get_rank(
        client,
        cache_name,
        sorted_set_name,
        value,
        opts \\ []
      ) do
    sort_order = Keyword.get(opts, :sort_order, :asc)

    ScsDataClient.sorted_set_get_rank(
      client.data_client,
      cache_name,
      sorted_set_name,
      value,
      sort_order
    )
  end

  @doc """
  Get the score of a value in a sorted set.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache containing the sorted set. Must be a string.
  - `sorted_set_name`: The name of the sorted set to get the score from. Must be a string.
  - `value`: The value to check the score of. Must be a binary.

  ## Returns

  - `{:ok, %Momento.Responses.SortedSet.GetScore.Hit{}}` if the value exists. It contains:
    - `score: float()`
  - `:miss` if the value does not exist.
  - `{:error, error}` if an error occurs.

  ## Examples

      iex> Momento.CacheClient.sorted_set_put_elements(client, "cache", "sorted-set",
      ...> [{"val1", 1.0}, {"val2", 2.0}, {"val3", 3.0}])
      {:ok, %Momento.Responses.SortedSet.PutElements.Ok{}}

      iex> Momento.CacheClient.sorted_set_get_score(client, "cache", "sorted-set", "val1")
      {:ok, %Momento.Responses.SortedSet.GetScore.Hit{score: 1.0}}

      iex> Momento.CacheClient.sorted_set_get_score(client, "cache", "sorted-set", "non-existent-value")
      :miss
  """
  @spec sorted_set_get_score(
          client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          value :: binary()
        ) :: Momento.Responses.SortedSet.GetScore.t()
  def sorted_set_get_score(
        client,
        cache_name,
        sorted_set_name,
        value
      ) do
    ScsDataClient.sorted_set_get_score(
      client.data_client,
      cache_name,
      sorted_set_name,
      value
    )
  end

  @doc """
  Get the scores of the given values in a sorted set.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache containing the sorted set. Must be a string.
  - `sorted_set_name`: The name of the sorted set to get the score from. Must be a string.
  - `values`: The value to check the score of. Must be a list of binaries.

  ## Returns

  - `{:ok, %Momento.Responses.SortedSet.GetScores.Hit{}}` if the value exists. It contains:
    - `value: [{binary(), float() | nil}]`
  - `:miss` if the sorted set does not exist.
  - `{:error, error}` if an error occurs.

  ## Examples

      iex> Momento.CacheClient.sorted_set_put_elements(client, "cache", "sorted-set",
      ...> [{"val1", 1.0}, {"val2", 2.0}, {"val3", 3.0}])
      {:ok, %Momento.Responses.SortedSet.PutElements.Ok{}}

      iex> Momento.CacheClient.sorted_set_get_scores(client, "cache", "sorted-set", ["val1", "val2"])
      {:ok,
      %Momento.Responses.SortedSet.GetScores.Hit{
       value: [{"val1", 1.0}, {"val2", 2.0}]
      }}

      iex> Momento.CacheClient.sorted_set_get_scores(client, "cache", "sorted-set", ["non-existent-value"])
      {:ok,
      %Momento.Responses.SortedSet.GetScores.Hit{
       value: [{"non-existent-value", nil}]
      }}

      iex> Momento.CacheClient.sorted_set_get_scores(client, "cache", "non-existent-set", ["val1"])
      :miss
  """
  @spec sorted_set_get_scores(
          client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          values :: [binary()]
        ) :: Momento.Responses.SortedSet.GetScores.t()
  def sorted_set_get_scores(
        client,
        cache_name,
        sorted_set_name,
        values
      ) do
    ScsDataClient.sorted_set_get_scores(
      client.data_client,
      cache_name,
      sorted_set_name,
      values
    )
  end

  @doc """
  Increments the score of a value in a sorted set. Adds the value if it is not present.

  ## Parameters

  - `client`: A `%Momento.CacheClient{}` representing the connected client.
  - `cache_name`: The name of the cache containing the sorted set. Must be a string.
  - `sorted_set_name`: The name of the sorted set to increment the value in. Must be a string.
  - `value`: The value to be incremented. Must be a binary.
  - `amount`: The amount to increment the value's score Must be a number.

  ## Options

  - `collection_ttl`: The TTL for the sorted set in the cache. Defaults to the client TTL.

  ## Returns

  - `{:ok, %Momento.Responses.SortedSet.IncrementScore.Ok{}}` on a successful increment.
  - `{:error, %Momento.Error{}}` if an error occurs.

  ## Examples

      iex> Momento.CacheClient.sorted_set_get_score(client, "cache", "sorted-set", "value")
      :miss

      iex> Momento.CacheClient.sorted_set_increment_score(client, "cache", "sorted-set", "value", 1.0)
      {:ok, %Momento.Responses.SortedSet.IncrementScore.Ok{score: 1.0}}

      iex> Momento.CacheClient.sorted_set_get_score(client, "cache", "sorted-set", "value")
      {:ok, %Momento.Responses.SortedSet.GetScore.Hit{score: 1.0}}
  """
  @spec sorted_set_increment_score(
          client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          value :: binary(),
          amount :: number(),
          opts :: [collection_ttl :: CollectionTtl.t()]
        ) :: Momento.Responses.SortedSet.IncrementScore.t()
  def sorted_set_increment_score(
        client,
        cache_name,
        sorted_set_name,
        value,
        amount,
        opts \\ []
      ) do
    collection_ttl =
      Keyword.get(opts, :collection_ttl, CollectionTtl.of(client.default_ttl_seconds))

    ScsDataClient.sorted_set_increment_score(
      client.data_client,
      cache_name,
      sorted_set_name,
      value,
      amount,
      collection_ttl
    )
  end
end
