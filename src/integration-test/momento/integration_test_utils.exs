defmodule Momento.IntegrationTestUtils do
  use ExUnit.Case

  alias Momento.CacheClient
  alias Momento.Configurations
  alias Momento.Auth.CredentialProvider

  def initialize_cache_client() do
    cache_name = System.get_env("TEST_CACHE_NAME")  || "elixir_integration_test_#{UUID.uuid4()}"

    if cache_name == nil do
      raise ArgumentError, "Missing required environment variable TEST_CACHE_NAME"
    end

    credential_provider = CredentialProvider.from_env_var!("TEST_AUTH_TOKEN")

    config = Configurations.Laptop.latest()

    cache_client = CacheClient.create!(config, credential_provider, 120)

    case CacheClient.create_cache(cache_client, cache_name) do
      {:ok, _} -> :ok
      :already_exists -> :ok
      {:error, error} -> raise error
    end

    [cache_name: cache_name, cache_client: cache_client]
  end

  @spec cleanup_cache(cache_state :: [cache_name: String.t(), cache_client: CacheClient.t()]) ::
          :ok
  def cleanup_cache(cache_state) do
    cache_name = Keyword.fetch!(cache_state, :cache_name)
    cache_client = Keyword.fetch!(cache_state, :cache_client)
    CacheClient.delete_cache(cache_client, cache_name)
    :ok
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
