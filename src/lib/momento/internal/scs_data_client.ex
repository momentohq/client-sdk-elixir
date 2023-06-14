defmodule Momento.Internal.ScsDataClient do
  alias Momento.Auth.CredentialProvider
  alias Momento.Responses.{Set, Get, Delete}
  import Momento.Validation

  @enforce_keys [:auth_token, :channel]
  defstruct [:auth_token, :channel]

  @opaque t() :: %__MODULE__{
            auth_token: String.t(),
            channel: GRPC.Channel.t()
          }

  @spec create!(CredentialProvider.t()) :: t()
  def create!(credential_provider) do
    cache_endpoint = CredentialProvider.cache_endpoint(credential_provider)
    tls_options = :tls_certificate_check.options(cache_endpoint)

    {:ok, channel} =
      GRPC.Stub.connect(cache_endpoint <> ":443",
        cred: GRPC.Credential.new(ssl: tls_options)
      )

    %__MODULE__{
      auth_token: CredentialProvider.auth_token(credential_provider),
      channel: channel
    }
  end

  @spec set(
          data_client :: t(),
          cache_name :: String.t(),
          key :: binary(),
          value :: binary(),
          ttl_seconds :: float()
        ) :: Momento.Responses.Set.t()
  def set(data_client, cache_name, key, value, ttl_seconds) do
    with :ok <- validate_cache_name(cache_name),
         :ok <- validate_key(key),
         :ok <- validate_value(value),
         :ok <- validate_ttl(ttl_seconds) do
      ttl_milliseconds = ttl_seconds |> Kernel.*(1000) |> round()
      metadata = %{cache: cache_name, Authorization: data_client.auth_token}

      set_request = %Momento.Protos.CacheClient.SetRequest{
        cache_key: key,
        cache_body: value,
        ttl_milliseconds: ttl_milliseconds
      }

      case Momento.Protos.CacheClient.Scs.Stub.set(data_client.channel, set_request,
             metadata: metadata
           ) do
        {:ok, _} -> {:ok, %Set.Ok{}}
        {:error, error_response} -> {:error, Momento.Error.convert(error_response)}
      end
    else
      error -> error
    end
  end

  @spec get(data_client :: t(), cache_name :: String.t(), key :: binary()) ::
          Momento.Responses.Get.t()
  def get(data_client, cache_name, key) do
    with :ok <- validate_cache_name(cache_name),
         :ok <- validate_key(key) do
      metadata = %{cache: cache_name, Authorization: data_client.auth_token}

      get_request = %Momento.Protos.CacheClient.GetRequest{cache_key: key}

      case Momento.Protos.CacheClient.Scs.Stub.get(data_client.channel, get_request,
             metadata: metadata
           ) do
        {:ok, %Momento.Protos.CacheClient.GetResponse{result: :Hit, cache_body: cache_body}} ->
          {:hit, %Get.Hit{value: cache_body}}

        {:ok, %Momento.Protos.CacheClient.GetResponse{result: :Miss}} ->
          :miss

        {:error, error_response} ->
          {:error, Momento.Error.convert(error_response)}
      end
    else
      error -> error
    end
  end

  @spec delete(data_client :: t(), cache_name :: String.t(), key :: binary()) ::
          Momento.Responses.Delete.t()
  def delete(data_client, cache_name, key) do
    with :ok <- validate_cache_name(cache_name),
         :ok <- validate_key(key) do
      metadata = %{cache: cache_name, Authorization: data_client.auth_token}

      delete_request = %Momento.Protos.CacheClient.DeleteRequest{cache_key: key}

      case Momento.Protos.CacheClient.Scs.Stub.delete(data_client.channel, delete_request,
             metadata: metadata
           ) do
        {:ok, _} -> {:ok, %Delete.Ok{}}
        {:error, error_response} -> {:error, Momento.Error.convert(error_response)}
      end
    else
      error -> error
    end
  end
end
