defmodule Momento.IntegrationTestUtils do
  use ExUnit.Case

  alias Momento.CacheClient
  alias Momento.Config.Transport.GrpcConfiguration
  alias Momento.Config.Transport.TransportStrategy
  alias Momento.Config.Configuration
  alias Momento.Auth.CredentialProvider

  def initialize_cache_client() do
    cache_name = System.get_env("TEST_CACHE_NAME")

    if cache_name == nil do
      raise ArgumentError, "Missing required environment variable TEST_CACHE_NAME"
    end

    credential_provider = CredentialProvider.from_env_var!("TEST_AUTH_TOKEN")

    config = %Configuration{
      transport_strategy: %TransportStrategy{
        grpc_config: %GrpcConfiguration{
          deadline_millis: 5000
        }
      }
    }

    cache_client = CacheClient.create!(config, credential_provider)
    [cache_name: cache_name, cache_client: cache_client]
  end

  def random_string(length) do
    :crypto.strong_rand_bytes(length)
    |> Base.encode16()
    |> binary_part(0, length)
  end

  def assert_validates_cache_name(f) do
    {:error, error} = f.(nil)
    assert String.contains?(error.message, "The cache name cannot be nil")

    {:error, error} = f.(12345)
    assert String.contains?(error.message, "The cache name must be a string")
  end
end
