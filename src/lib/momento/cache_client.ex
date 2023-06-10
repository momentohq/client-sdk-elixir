defmodule Momento.CacheClient do
  require Logger

  @moduledoc """
  Documentation for `Momento.CacheClient`.
  """
  @enforce_keys [:config, :credential_provider, :control_channel, :cache_channel]
  defstruct [:config, :credential_provider, :control_channel, :cache_channel]

  @opaque t() :: %__MODULE__{
            config: Momento.Configuration.t(),
            credential_provider: Momento.Auth.CredentialProvider.t(),
            control_channel: GRPC.Channel.t(),
            cache_channel: GRPC.Channel.t()
          }

  @spec create_client(Momento.Configuration.t(), Momento.Auth.CredentialProvider.t()) ::
          {:ok, Momento.CacheClient.t()} | {:error, String.t()}
  def create_client(config, credential_provider) do
    with {:ok, control_channel} <-
           Momento.Internal.ScsControlClient.init_channel(config, credential_provider),
         {:ok, cache_channel} <-
           Momento.Internal.ScsDataClient.init_channel(config, credential_provider) do
      {:ok,
       %Momento.CacheClient{
         config: config,
         credential_provider: credential_provider,
         control_channel: control_channel,
         cache_channel: cache_channel
       }
      }
      end
  end

  @doc """
  Set the value in cache with a given time to live (TTL) seconds.

  ## Examples

      TODO

  """
  @spec set(Momento.CacheClient.t(), String.t(), binary, binary, float) ::
          Momento.Responses.Set.t()
  def set(cache_client, cache_name, key, value, ttl_seconds) do
    Momento.Internal.ScsDataClient.set(cache_client, cache_name, key, value, ttl_seconds)
  end

  @doc """
  Get a value from the cache.

  ## Examples

      TODO

  """
  @spec get(Momento.CacheClient.t(), String.t(), binary) :: Momento.Responses.Get.t()
  def get(cache_client, cache_name, key) do
    Momento.Internal.ScsDataClient.get(cache_client, cache_name, key)
  end
end
