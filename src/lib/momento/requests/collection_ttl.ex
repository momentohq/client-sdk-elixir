defmodule Momento.Requests.CollectionTtl do
  @moduledoc """
  Represents the desired behavior for managing the TTL on collection objects (dictionaries, lists,
  sets) in a cache.

  The first time the collection is created, it needs a TTL set on it. For subsequent operations that
  modify the collection, one may choose to update the TTL in order to prolong the life of the cached
  collection object, or leave the TTL unmodified in order to ensure that the collection expires at
  the original TTL.

  The default behavior is to refresh the TTL (to prolong the life of the collection) each time it is
  written.
  """

  @enforce_keys [:ttl_seconds, :refresh_ttl]
  defstruct [:ttl_seconds, :refresh_ttl]

  @type t() :: %__MODULE__{
          ttl_seconds: number() | nil,
          refresh_ttl: boolean()
        }

  @doc """
  Constructs a CollectionTtl with the provided TTL in seconds that refreshes the collection's TTL when used.

  ## Parameters

  - `ttl_seconds`: TTL in seconds.
  """
  @spec of(ttl_seconds :: number()) :: t()
  def of(ttl_seconds) do
    %Momento.Requests.CollectionTtl{
      ttl_seconds: ttl_seconds,
      refresh_ttl: true
    }
  end

  @doc """
  Constructs a CollectionTtl with the client's default TTL that refreshes the collection's TTL when used.
  """
  @spec from_cache_ttl() :: t()
  def from_cache_ttl() do
    %Momento.Requests.CollectionTtl{
      ttl_seconds: nil,
      refresh_ttl: true
    }
  end

  @doc """
  Constructs a CollectionTtl with the provided TTL or nil. Will only refresh if the TTL is provided.

  ## Parameters

  - `ttl_seconds`: TTL in seconds or nil.
  """
  @spec refresh_ttl_if_provided(ttl_seconds :: number() | nil) :: t()
  def refresh_ttl_if_provided(nil) do
    %Momento.Requests.CollectionTtl{
      ttl_seconds: nil,
      refresh_ttl: false
    }
  end

  def refresh_ttl_if_provided(ttl_seconds) do
    %Momento.Requests.CollectionTtl{
      ttl_seconds: ttl_seconds,
      refresh_ttl: true
    }
  end

  @doc """
  If the TTL in the given CollectionTtl is nil, replaces it with the provided TTL.

  ## Parameters

  - `collection_ttl`: A CollectionTtl.
  - `ttl_seconds`: TTL in seconds to be set if absent in collection_ttl.
  """
  @spec replace_ttl_if_absent(collection_ttl :: t(), ttl_seconds :: number()) :: t()
  def replace_ttl_if_absent(collection_ttl, ttl_seconds) do
    if collection_ttl.ttl_seconds == nil do
      %{collection_ttl | ttl_seconds: ttl_seconds}
    else
      collection_ttl
    end
  end
end
