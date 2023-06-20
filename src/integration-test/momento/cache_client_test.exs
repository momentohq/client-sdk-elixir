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

    {:ok, _} = CacheClient.set(cache_client, cache_name, key, value, ttl_seconds)

    {:hit, get_result} = CacheClient.get(cache_client, cache_name, key)
    assert match?(^value, get_result.value)

    {:ok, _} = CacheClient.delete(cache_client, cache_name, key)

    :miss = CacheClient.get(cache_client, cache_name, key)
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
    assert String.contains?(error.message, "The TTL must be a float")

    {:error, error} = CacheClient.set(cache_client, cache_name, key, value, -20.0)
    assert String.contains?(error.message, "The TTL must be positive")
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

    {:ok, _} = CacheClient.delete(cache_client, cache_name, key)
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

  describe "sorted_set_put_elements/5" do
    test "should be able to put elements in a sorted set, overwriting existing elements", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      sorted_set_name = random_string(16)
      first_elements = %{"key1" => 1.0, "key2" => 2.0}
      second_elements = %{"key2" => 5.0, "key3" => 3.0}

      :miss = CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name)

      {:ok, _} =
        CacheClient.sorted_set_put_elements(
          cache_client,
          cache_name,
          sorted_set_name,
          first_elements
        )

      {:ok, hit} = CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name)
      assert hit.value == [{"key1", 1.0}, {"key2", 2.0}]

      {:ok, _} =
        CacheClient.sorted_set_put_elements(
          cache_client,
          cache_name,
          sorted_set_name,
          second_elements
        )

      {:ok, hit} = CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name)
      assert hit.value == [{"key1", 1.0}, {"key3", 3.0}, {"key2", 5.0}]
    end
  end

  describe "sorted_set_put_element/6" do
    test "should be able to put individual elements in a sorted set, overwriting existing elements",
         %{
           cache_client: cache_client,
           cache_name: cache_name
         } do
      sorted_set_name = random_string(16)

      :miss = CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name)

      {:ok, _} =
        CacheClient.sorted_set_put_element(cache_client, cache_name, sorted_set_name, "key1", 1.0)

      {:ok, hit} = CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name)
      assert hit.value == [{"key1", 1.0}]

      {:ok, _} =
        CacheClient.sorted_set_put_element(cache_client, cache_name, sorted_set_name, "key1", 5.0)

      {:ok, hit} = CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name)
      assert hit.value == [{"key1", 5.0}]

      {:ok, _} =
        CacheClient.sorted_set_put_element(cache_client, cache_name, sorted_set_name, "key2", 2.0)

      {:ok, hit} = CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name)
      assert hit.value == [{"key2", 2.0}, {"key1", 5.0}]
    end
  end

  describe "sorted_set_fetch_by_rank/6" do
    test "should be able to fetch in ascending and descending order", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      sorted_set_name = random_string(16)
      elements = %{"key1" => 1.0, "key2" => 2.0, "key3" => 3.0}

      :miss = CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name)

      {:ok, _} =
        CacheClient.sorted_set_put_elements(cache_client, cache_name, sorted_set_name, elements)

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_rank(
          cache_client,
          cache_name,
          sorted_set_name,
          sort_order: :asc
        )

      assert hit.value == [{"key1", 1.0}, {"key2", 2.0}, {"key3", 3.0}]

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_rank(
          cache_client,
          cache_name,
          sorted_set_name,
          sort_order: :desc
        )

      assert hit.value == [{"key3", 3.0}, {"key2", 2.0}, {"key1", 1.0}]
    end

    test "should be able to fetch a subset of a sorted set", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      sorted_set_name = random_string(16)
      elements = [{"key1", 1.0}, {"key2", 2.0}, {"key3", 3.0}, {"key4", 4.0}, {"key5", 5.0}]

      :miss = CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name)

      {:ok, _} =
        CacheClient.sorted_set_put_elements(cache_client, cache_name, sorted_set_name, elements)

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name,
          start_rank: 0
        )

      assert hit.value == [
               {"key1", 1.0},
               {"key2", 2.0},
               {"key3", 3.0},
               {"key4", 4.0},
               {"key5", 5.0}
             ]

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name,
          start_rank: 0,
          end_rank: 5
        )

      assert hit.value == [
               {"key1", 1.0},
               {"key2", 2.0},
               {"key3", 3.0},
               {"key4", 4.0},
               {"key5", 5.0}
             ]

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name,
          start_rank: 0,
          end_rank: 100
        )

      assert hit.value == [
               {"key1", 1.0},
               {"key2", 2.0},
               {"key3", 3.0},
               {"key4", 4.0},
               {"key5", 5.0}
             ]

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name,
          start_rank: 1,
          end_rank: 3
        )

      assert hit.value == [{"key2", 2.0}, {"key3", 3.0}]

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_rank(
          cache_client,
          cache_name,
          sorted_set_name,
          start_rank: 1,
          end_rank: 3,
          sort_order: :desc
        )

      assert hit.value == [{"key4", 4.0}, {"key3", 3.0}]
    end
  end

  describe "sorted_set_fetch_by_score/8" do
    test "should be able to fetch in ascending and descending order", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      sorted_set_name = random_string(16)
      elements = %{"key1" => 1.0, "key2" => 2.0, "key3" => 3.0}

      :miss = CacheClient.sorted_set_fetch_by_score(cache_client, cache_name, sorted_set_name)

      {:ok, _} =
        CacheClient.sorted_set_put_elements(cache_client, cache_name, sorted_set_name, elements)

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          cache_name,
          sorted_set_name,
          sort_order: :asc
        )

      assert hit.value == [{"key1", 1.0}, {"key2", 2.0}, {"key3", 3.0}]

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          cache_name,
          sorted_set_name,
          sort_order: :desc
        )

      assert hit.value == [{"key3", 3.0}, {"key2", 2.0}, {"key1", 1.0}]
    end

    test "should be able to fetch a subset of a sorted set", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      sorted_set_name = random_string(16)
      elements = [{"key1", 1.0}, {"key2", 2.0}, {"key3", 3.0}, {"key4", 4.0}, {"key5", 5.0}]

      :miss = CacheClient.sorted_set_fetch_by_score(cache_client, cache_name, sorted_set_name)

      {:ok, _} =
        CacheClient.sorted_set_put_elements(cache_client, cache_name, sorted_set_name, elements)

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_score(cache_client, cache_name, sorted_set_name,
          min_score: 0.0
        )

      assert hit.value == [
               {"key1", 1.0},
               {"key2", 2.0},
               {"key3", 3.0},
               {"key4", 4.0},
               {"key5", 5.0}
             ]

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_score(cache_client, cache_name, sorted_set_name,
          min_score: 0.0,
          max_score: 5.0
        )

      assert hit.value == [
               {"key1", 1.0},
               {"key2", 2.0},
               {"key3", 3.0},
               {"key4", 4.0},
               {"key5", 5.0}
             ]

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_score(cache_client, cache_name, sorted_set_name,
          min_score: 2.0,
          max_score: 3.0
        )

      assert hit.value == [{"key2", 2.0}, {"key3", 3.0}]

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          cache_name,
          sorted_set_name,
          min_score: 3.0,
          max_score: 4.0,
          sort_order: :desc
        )

      assert hit.value == [{"key4", 4.0}, {"key3", 3.0}]

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          cache_name,
          sorted_set_name,
          offset: 1,
          count: 2
        )

      assert hit.value == [{"key2", 2.0}, {"key3", 3.0}]

      {:ok, hit} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          cache_name,
          sorted_set_name,
          max_score: 4.0,
          offset: 1,
          count: 2,
          sort_order: :desc
        )

      assert hit.value == [{"key3", 3.0}, {"key2", 2.0}]
    end

    test "should fail if the cache name is invalid", %{
      cache_client: cache_client
    } do
      sorted_set_name = "sorted set"

      {:error, error} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          nil,
          sorted_set_name
        )

      assert String.contains?(error.message, "The cache name cannot be nil")

      {:error, error} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          12345,
          sorted_set_name
        )

      assert String.contains?(error.message, "The cache name must be a string")
    end

    test "should fail if the sorted set name is invalid", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      {:error, error} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          cache_name,
          nil
        )

      assert String.contains?(error.message, "The sorted set name cannot be nil")

      {:error, error} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          cache_name,
          12345
        )

      assert String.contains?(error.message, "The sorted set name must be a string")
    end

    test "should fail if the scores are invalid", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      sorted_set_name = random_string(16)

      {:error, error} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          cache_name,
          sorted_set_name,
          min_score: "five"
        )

      assert :invalid_argument_error = error.error_code
      assert %Protobuf.EncodeError{} = error.cause

      {:error, error} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          cache_name,
          sorted_set_name,
          max_score: "five"
        )

      assert :invalid_argument_error = error.error_code
      assert %Protobuf.EncodeError{} = error.cause
    end

    test "should fail if the offset is invalid", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      sorted_set_name = random_string(16)

      {:error, error} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          cache_name,
          sorted_set_name,
          offset: 1.1
        )

      assert :invalid_argument_error = error.error_code
      assert %Protobuf.EncodeError{} = error.cause

      {:error, error} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          cache_name,
          sorted_set_name,
          offset: -10
        )

      assert :invalid_argument_error = error.error_code
      assert %Protobuf.EncodeError{} = error.cause

      {:error, error} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          cache_name,
          sorted_set_name,
          offset: "five"
        )

      assert :invalid_argument_error = error.error_code
      assert %Protobuf.EncodeError{} = error.cause
    end

    test "should fail if the count is invalid", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      sorted_set_name = random_string(16)

      {:error, error} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          cache_name,
          sorted_set_name,
          count: 1.1
        )

      assert :invalid_argument_error = error.error_code
      assert %Protobuf.EncodeError{} = error.cause

      {:error, error} =
        CacheClient.sorted_set_fetch_by_score(
          cache_client,
          cache_name,
          sorted_set_name,
          count: "five"
        )

      assert :invalid_argument_error = error.error_code
      assert %Protobuf.EncodeError{} = error.cause
    end
  end

  describe "sorted_set_remove_element/4" do
    test "should remove an element from a sorted set", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      sorted_set_name = random_string(16)
      elements = [{"key1", 1.0}, {"key2", 2.0}, {"key3", 3.0}, {"key4", 4.0}, {"key5", 5.0}]

      {:ok, _} =
        CacheClient.sorted_set_remove_element(cache_client, cache_name, sorted_set_name, "key1")

      {:ok, _} =
        CacheClient.sorted_set_put_elements(cache_client, cache_name, sorted_set_name, elements)

      {:ok, _} =
        CacheClient.sorted_set_remove_element(cache_client, cache_name, sorted_set_name, "key5")

      {:ok, hit} = CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name)
      assert hit.value == [{"key1", 1.0}, {"key2", 2.0}, {"key3", 3.0}, {"key4", 4.0}]

      {:ok, _} =
        CacheClient.sorted_set_remove_element(cache_client, cache_name, sorted_set_name, "key99")

      {:ok, hit} = CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name)
      assert hit.value == [{"key1", 1.0}, {"key2", 2.0}, {"key3", 3.0}, {"key4", 4.0}]
    end

    test "should fail if the cache name is invalid", %{
      cache_client: cache_client
    } do
      sorted_set_name = random_string(16)
      value = "key1"

      {:error, error} =
        CacheClient.sorted_set_remove_element(
          cache_client,
          nil,
          sorted_set_name,
          value
        )

      assert String.contains?(error.message, "The cache name cannot be nil")

      {:error, error} =
        CacheClient.sorted_set_remove_element(
          cache_client,
          12345,
          sorted_set_name,
          value
        )

      assert String.contains?(error.message, "The cache name must be a string")
    end

    test "should fail if the sorted set name is invalid", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      value = "key1"

      {:error, error} =
        CacheClient.sorted_set_remove_element(
          cache_client,
          cache_name,
          nil,
          value
        )

      assert String.contains?(error.message, "The sorted set name cannot be nil")

      {:error, error} =
        CacheClient.sorted_set_remove_element(
          cache_client,
          cache_name,
          12345,
          value
        )

      assert String.contains?(error.message, "The sorted set name must be a string")
    end

    test "should fail if the value is invalid", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      sorted_set_name = random_string(16)

      {:error, error} =
        CacheClient.sorted_set_remove_element(
          cache_client,
          cache_name,
          sorted_set_name,
          nil
        )

      assert :invalid_argument_error = error.error_code
      assert %Protobuf.EncodeError{} = error.cause

      {:error, error} =
        CacheClient.sorted_set_remove_element(
          cache_client,
          cache_name,
          sorted_set_name,
          12345
        )

      assert :invalid_argument_error = error.error_code
      assert %Protobuf.EncodeError{} = error.cause
    end
  end

  describe "sorted_set_remove_elements/4" do
    test "should remove elements from a sorted set", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      sorted_set_name = random_string(16)
      elements = [{"key1", 1.0}, {"key2", 2.0}, {"key3", 3.0}, {"key4", 4.0}, {"key5", 5.0}]

      {:ok, _} =
        CacheClient.sorted_set_remove_elements(cache_client, cache_name, sorted_set_name, ["key1"])

      {:ok, _} =
        CacheClient.sorted_set_put_elements(cache_client, cache_name, sorted_set_name, elements)

      {:ok, _} =
        CacheClient.sorted_set_remove_elements(cache_client, cache_name, sorted_set_name, [
          "key4",
          "key5",
          "key99"
        ])

      {:ok, hit} = CacheClient.sorted_set_fetch_by_rank(cache_client, cache_name, sorted_set_name)
      assert hit.value == [{"key1", 1.0}, {"key2", 2.0}, {"key3", 3.0}]
    end

    test "should fail if the cache name is invalid", %{
      cache_client: cache_client
    } do
      sorted_set_name = random_string(16)
      values = ["key1"]

      {:error, error} =
        CacheClient.sorted_set_remove_elements(
          cache_client,
          nil,
          sorted_set_name,
          values
        )

      assert String.contains?(error.message, "The cache name cannot be nil")

      {:error, error} =
        CacheClient.sorted_set_remove_elements(
          cache_client,
          12345,
          sorted_set_name,
          values
        )

      assert String.contains?(error.message, "The cache name must be a string")
    end

    test "should fail if the sorted set name is invalid", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      values = ["key1"]

      {:error, error} =
        CacheClient.sorted_set_remove_elements(
          cache_client,
          cache_name,
          nil,
          values
        )

      assert String.contains?(error.message, "The sorted set name cannot be nil")

      {:error, error} =
        CacheClient.sorted_set_remove_elements(
          cache_client,
          cache_name,
          12345,
          values
        )

      assert String.contains?(error.message, "The sorted set name must be a string")
    end

    test "should fail if the value is invalid", %{
      cache_client: cache_client,
      cache_name: cache_name
    } do
      sorted_set_name = random_string(16)

      {:error, error} =
        CacheClient.sorted_set_remove_elements(
          cache_client,
          cache_name,
          sorted_set_name,
          12345
        )

      assert :invalid_argument_error = error.error_code
      assert %Protobuf.EncodeError{} = error.cause

      {:error, error} =
        CacheClient.sorted_set_remove_elements(
          cache_client,
          cache_name,
          sorted_set_name,
          "key1"
        )

      assert :invalid_argument_error = error.error_code
      assert %Protobuf.EncodeError{} = error.cause
    end
  end
end
