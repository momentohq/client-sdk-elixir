defmodule Momento.CacheClient do
  alias Momento.CacheClient
  alias Momento.Auth.CredentialProvider
  alias Momento.Configuration
  alias Momento.Internal.ScsControlClient
  alias Momento.Internal.ScsDataClient

  require Logger

  @moduledoc """
  Documentation for `Momento.CacheClient`.
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

  ## Examples

      TODO

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

  ## Examples

      TODO

  """
  @spec get(cache_client :: t(), cache_name :: String.t(), key :: binary) ::
          Momento.Responses.Get.t()
  def get(cache_client, cache_name, key) do
    ScsDataClient.get(cache_client.data_client, cache_name, key)
  end
end
