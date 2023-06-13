defmodule CacheClientTest do
  use ExUnit.Case
  doctest Momento.CacheClient

  alias Momento.CacheClient
  alias Momento.Configuration
  alias Momento.Auth.CredentialProvider

  setup_all do
    cache_name = System.get_env("TEST_CACHE_NAME")
    credential_provider = CredentialProvider.from_env_var!("TEST_AUTH_TOKEN")
    {:ok, cache_name: cache_name, credential_provider: credential_provider}
  end

  setup %{credential_provider: credential_provider} do
    config = %Configuration{}
    cache_client = CacheClient.create_client!(config, credential_provider)
    {:ok, cache_client: cache_client}
  end

  test "set/5 successfully sets a value in the cache", %{
    cache_client: cache_client,
    cache_name: cache_name
  } do
    key = random_string(16)
    value = "test_value"
    ttl_seconds = 60.0

    assert CacheClient.set(cache_client, cache_name, key, value, ttl_seconds) == :success

    {:hit, get_result} = CacheClient.get(cache_client, cache_name, key)
    assert match?(^value, get_result)

    assert CacheClient.delete(cache_client, cache_name, key) == :success

    assert CacheClient.get(cache_client, cache_name, key) == :miss
  end

  test "set/5 returns an error with a bad cache name", %{cache_client: cache_client} do
    key = random_string(16)
    value = "test_value"
    ttl_seconds = 60.0

    {:error, error} = CacheClient.set(cache_client, nil, key, value, ttl_seconds)
    assert String.contains?(error.message, "The cache name cannot be nil")

    {:error, error} = CacheClient.set(cache_client, 12345, key, value, ttl_seconds)
    assert String.contains?(error.message, "The cache name must be a string")
  end

  test "set/5 returns an error with a bad key", %{
    cache_client: cache_client,
    cache_name: cache_name
  } do
    value = "test_value"
    ttl_seconds = 60.0

    {:error, error} = CacheClient.set(cache_client, cache_name, nil, value, ttl_seconds)
    assert String.contains?(error.message, "The key cannot be nil")

    {:error, error} = CacheClient.set(cache_client, cache_name, 12345, value, ttl_seconds)
    assert String.contains?(error.message, "The key must be a binary")
  end

  test "set/5 returns an error with a bad value", %{
    cache_client: cache_client,
    cache_name: cache_name
  } do
    key = random_string(16)
    ttl_seconds = 60.0

    {:error, error} = CacheClient.set(cache_client, cache_name, key, nil, ttl_seconds)
    assert String.contains?(error.message, "The value cannot be nil")

    {:error, error} = CacheClient.set(cache_client, cache_name, key, 12345, ttl_seconds)
    assert String.contains?(error.message, "The value must be a binary")
  end

  test "set/5 returns an error with a bad TTL", %{
    cache_client: cache_client,
    cache_name: cache_name
  } do
    key = random_string(16)
    value = "test_value"

    {:error, error} = CacheClient.set(cache_client, cache_name, key, value, "sixty")
    assert String.contains?(error.message, "The TTL must be a positive float")

    {:error, error} = CacheClient.set(cache_client, cache_name, key, value, -20.0)
    assert String.contains?(error.message, "The TTL must be a positive float")
  end

  test "get/3 returns miss when no value is found for a key", %{
    cache_client: cache_client,
    cache_name: cache_name
  } do
    key = random_string(16)

    assert CacheClient.get(cache_client, cache_name, key) == :miss
  end

  test "get/3 returns an error with a bad cache name", %{cache_client: cache_client} do
    key = random_string(16)

    {:error, error} = CacheClient.get(cache_client, nil, key)
    assert String.contains?(error.message, "The cache name cannot be nil")

    {:error, error} = CacheClient.get(cache_client, 12345, key)
    assert String.contains?(error.message, "The cache name must be a string")
  end

  test "get/3 returns an error with a bad key", %{
    cache_client: cache_client,
    cache_name: cache_name
  } do
    {:error, error} = CacheClient.get(cache_client, cache_name, nil)
    assert String.contains?(error.message, "The key cannot be nil")

    {:error, error} = CacheClient.get(cache_client, cache_name, 12345)
    assert String.contains?(error.message, "The key must be a binary")
  end

  test "delete/3 returns success when no value is found for a key", %{
    cache_client: cache_client,
    cache_name: cache_name
  } do
    key = random_string(16)

    assert CacheClient.delete(cache_client, cache_name, key) == :success
  end

  test "delete/3 returns an error with a bad cache name", %{cache_client: cache_client} do
    key = random_string(16)

    {:error, error} = CacheClient.delete(cache_client, nil, key)
    assert String.contains?(error.message, "The cache name cannot be nil")

    {:error, error} = CacheClient.delete(cache_client, 12345, key)
    assert String.contains?(error.message, "The cache name must be a string")
  end

  test "delete/3 returns an error with a bad key", %{
    cache_client: cache_client,
    cache_name: cache_name
  } do
    {:error, error} = CacheClient.delete(cache_client, cache_name, nil)
    assert String.contains?(error.message, "The key cannot be nil")

    {:error, error} = CacheClient.delete(cache_client, cache_name, 12345)
    assert String.contains?(error.message, "The key must be a binary")
  end

  def random_string(length) do
    :crypto.strong_rand_bytes(length)
    |> Base.encode16()
    |> binary_part(0, length)
  end
end
