Code.require_file("integration-test/momento/integration_test_utils.exs")

defmodule CacheControlPlaneTest do
  use ExUnit.Case

  alias Momento.CacheClient

  import Momento.IntegrationTestUtils,
    only: [
      initialize_cache_client: 0,
      cleanup_cache: 1,
      random_string: 1,
      assert_validates_cache_name: 1
    ]

  setup_all do
    client_state = initialize_cache_client()
    on_exit(fn -> cleanup_cache(client_state) end)
    {:ok, client_state}
  end

  describe "create_cache, list_caches, delete_cache happy path" do
    test "should be able to create a cache, list it, and delete it", %{cache_client: cache_client} do
      cache_name = "elixir-int-test-#{random_string(10)}"

      {:ok, result} = CacheClient.list_caches(cache_client)
      cache_names = Enum.map(result.caches, fn c -> c.name end)
      assert(not Enum.member?(cache_names, cache_name))
      {:ok, _} = CacheClient.create_cache(cache_client, cache_name)
      {:ok, result} = CacheClient.list_caches(cache_client)
      cache_names = Enum.map(result.caches, fn c -> c.name end)
      assert(Enum.member?(cache_names, cache_name))
      {:ok, _} = CacheClient.delete_cache(cache_client, cache_name)
      {:ok, result} = CacheClient.list_caches(cache_client)
      cache_names = Enum.map(result.caches, fn c -> c.name end)
      assert(not Enum.member?(cache_names, cache_name))
    end
  end

  describe "create_cache" do
    test "should validate cache name", %{cache_client: cache_client} do
      assert_validates_cache_name(fn cache_name ->
        CacheClient.create_cache(cache_client, cache_name)
      end)
    end

    test "should return :already_exists if the cache already exists", %{
      cache_client: cache_client
    } do
      cache_name = "elixir-int-test-#{random_string(10)}"
      {:ok, _} = CacheClient.create_cache(cache_client, cache_name)
      :already_exists = CacheClient.create_cache(cache_client, cache_name)
      {:ok, _} = CacheClient.delete_cache(cache_client, cache_name)
    end
  end

  describe "delete_cache" do
    test "should validate cache name", %{cache_client: cache_client} do
      assert_validates_cache_name(fn cache_name ->
        CacheClient.delete_cache(cache_client, cache_name)
      end)
    end

    test "should return NotFound error if the cache does not exist", %{cache_client: cache_client} do
      cache_name = "elixir-int-test-#{random_string(10)}"
      {:error, error} = CacheClient.delete_cache(cache_client, cache_name)
      assert String.contains?(error.message, "A cache with the specified name does not exist")
    end
  end
end
