defmodule Momento.Internal.ScsControlClient do
  import Momento.Validation

  alias Momento.Auth.CredentialProvider
  alias Momento.Responses.{CacheInfo, CreateCache, DeleteCache, ListCaches}

  @moduledoc false

  @enforce_keys [:auth_token, :channel]
  defstruct [:auth_token, :channel]

  @opaque t() :: %__MODULE__{
            auth_token: String.t(),
            channel: GRPC.Channel.t()
          }

  defimpl Inspect, for: Momento.Internal.ScsControlClient do
    def inspect(%Momento.Internal.ScsControlClient{} = control_client, _opts) do
      "#Momento.Internal.ScsControlClient<auth_token: [hidden], channel: #{inspect(control_client.channel)}>"
    end
  end

  @spec create(CredentialProvider.t()) :: {:ok, t()} | {:error, any()}
  def create(credential_provider) do
    control_endpoint = CredentialProvider.control_endpoint(credential_provider)
    tls_options = :tls_certificate_check.options(control_endpoint)

    with {:ok, channel} <-
           GRPC.Stub.connect(control_endpoint <> ":443",
             cred: GRPC.Credential.new(ssl: tls_options)
           ) do
      {:ok,
       %__MODULE__{
         auth_token: CredentialProvider.auth_token(credential_provider),
         channel: channel
       }}
    end
  end

  @spec list_caches(client :: t()) :: Momento.Responses.ListCaches.t()
  def list_caches(client) do
    metadata = %{Authorization: client.auth_token}
    list_caches_request = %Momento.Protos.ControlClient.ListCachesRequest{}

    case Momento.Protos.ControlClient.ScsControl.Stub.list_caches(
           client.channel,
           list_caches_request,
           metadata: metadata
         ) do
      {:ok, response} ->
        {:ok,
         %ListCaches.Ok{
           caches: Enum.map(response.cache, fn c -> %CacheInfo{name: c.cache_name} end)
         }}

      {:error, error_response} ->
        {:error, Momento.Error.convert(error_response)}
    end
  end

  @spec create_cache(client :: t(), cache_name :: String.t()) :: Momento.Responses.CreateCache.t()
  def create_cache(client, cache_name) do
    metadata = %{Authorization: client.auth_token}

    create_cache_request = %Momento.Protos.ControlClient.CreateCacheRequest{
      cache_name: cache_name
    }

    with :ok <- validate_cache_name(cache_name) do
      case Momento.Protos.ControlClient.ScsControl.Stub.create_cache(
             client.channel,
             create_cache_request,
             metadata: metadata
           ) do
        {:ok, _} ->
          {:ok, %CreateCache.Ok{}}

        {:error, error_response} ->
          err = Momento.Error.convert(error_response)

          case err.error_code do
            :already_exists_error -> :already_exists
            _ -> {:error, err}
          end
      end
    end
  end

  @spec delete_cache(client :: t(), cache_name :: String.t()) :: Momento.Responses.DeleteCache.t()
  def delete_cache(client, cache_name) do
    metadata = %{Authorization: client.auth_token}

    delete_cache_request = %Momento.Protos.ControlClient.DeleteCacheRequest{
      cache_name: cache_name
    }

    with :ok <- validate_cache_name(cache_name) do
      case Momento.Protos.ControlClient.ScsControl.Stub.delete_cache(
             client.channel,
             delete_cache_request,
             metadata: metadata
           ) do
        {:ok, _} ->
          {:ok, %DeleteCache.Ok{}}

        {:error, error_response} ->
          {:error, Momento.Error.convert(error_response)}
      end
    end
  end
end
