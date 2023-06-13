Code.require_file("integration-test/momento/integration_test_utils.exs")

defmodule CacheClientTest do
  use ExUnit.Case
  doctest Momento.CacheClient

  alias Momento.CacheClient

  import Momento.IntegrationTestUtils,
    only: [
      initialize_cache_client: 0,
      random_string: 1,
      assert_validates_cache_name: 1
    ]

  setup_all do
    {:ok, initialize_cache_client()}
  end

  test "set/5 validates cache name", %{
    cache_client: cache_client
  } do
    assert_validates_cache_name(fn cache_name ->
      CacheClient.set(cache_client, cache_name, "foo", "bar", 60)
    end)
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

  test "get/3 validates cache name", %{cache_client: cache_client} do
    assert_validates_cache_name(fn cache_name ->
      CacheClient.get(cache_client, cache_name, "foo")
    end)
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

  test "delete/3 validates cache name", %{cache_client: cache_client} do
    assert_validates_cache_name(fn cache_name ->
      CacheClient.delete(cache_client, cache_name, "foo")
    end)
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
end
