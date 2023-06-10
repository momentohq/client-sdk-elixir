defmodule Momento.Internal.ScsDataClient do
  @spec init_channel(Momento.Configuration.t(), Momento.Auth.CredentialProvider.t()) ::
          {:ok, GRPC.Channel.t()} | {:error, String.t()}
  def init_channel(config, credential_provider) do
    GRPC.Stub.connect(credential_provider.cache_endpoint <> ":443", cred: GRPC.Credential.new([]))
  end

  @spec set(Momento.CacheClient.t(), String.t(), binary, binary, float) ::
          Momento.Responses.Set.t()
  def set(cache_client, cache_name, key, value, ttl_seconds) do
    ttl_milliseconds = ttl_seconds |> Kernel.*(1000) |> round()
    metadata = %{cache: cache_name, Authorization: cache_client.credential_provider.auth_token}

    setRequest = %CacheClient.SetRequest{
      cache_key: key,
      cache_body: value,
      ttl_milliseconds: ttl_milliseconds
    }

    case CacheClient.Scs.Stub.set(cache_client.cache_channel, setRequest, metadata: metadata) do
      {:ok, _} -> :success
      {:error, error_response} -> {:error, Momento.Error.convert(error_response)}
    end
  end

  @spec get(Momento.CacheClient.t(), String.t(), binary) :: Momento.Responses.Get.t()
  def get(cache_client, cache_name, key) do
    metadata = %{cache: cache_name, Authorization: cache_client.credential_provider.auth_token}

    getRequest = %CacheClient.GetRequest{cache_key: key}

    case CacheClient.Scs.Stub.get(cache_client.cache_channel, getRequest, metadata: metadata) do
      {:ok, %CacheClient.GetResponse{result: :Hit, cache_body: cache_body}} -> {:hit, cache_body}
      {:ok, %CacheClient.GetResponse{result: :Miss}} -> :miss
      {:error, error_response} -> {:error, Momento.Error.convert(error_response)}
    end
  end
end
