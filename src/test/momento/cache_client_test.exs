defmodule Momento.CacheClientTest do
  use ExUnit.Case

  alias Momento.CacheClient

  @fake_cache_client %Momento.CacheClient{
    config: %Momento.Config.Configuration{
      transport_strategy: %Momento.Config.Transport.TransportStrategy{
        grpc_config: %Momento.Config.Transport.GrpcConfiguration{
          deadline_millis: 5000
        }
      }
    },
    credential_provider: %Momento.Auth.CredentialProvider{
      control_endpoint: "fake",
      cache_endpoint: "fake",
      auth_token: "fake"
    },
    default_ttl_seconds: 100.0,
    control_client: "fake",
    data_client: "fake"
  }

  describe "sorted_set_put_element/6" do
    test "returns an error with a bad cache name" do
      sorted_set_name = "sorted set name"
      value = "value"
      score = 1.0
      collection_ttl = Momento.Requests.CollectionTtl.of(60.0)

      {:error, error} =
        CacheClient.sorted_set_put_element(
          @fake_cache_client,
          nil,
          sorted_set_name,
          value,
          score,
          collection_ttl: collection_ttl
        )

      assert String.contains?(error.message, "The cache name cannot be nil")

      {:error, error} =
        CacheClient.sorted_set_put_element(
          @fake_cache_client,
          12345,
          sorted_set_name,
          value,
          score,
          collection_ttl: collection_ttl
        )

      assert String.contains?(error.message, "The cache name must be a string")
    end

    test "returns an error with a bad sorted set name" do
      cache_name = "cache name"
      value = "value"
      score = 1.0
      collection_ttl = Momento.Requests.CollectionTtl.of(60.0)

      {:error, error} =
        CacheClient.sorted_set_put_element(
          @fake_cache_client,
          cache_name,
          nil,
          value,
          score,
          collection_ttl: collection_ttl
        )

      assert String.contains?(error.message, "The sorted set name cannot be nil")

      {:error, error} =
        CacheClient.sorted_set_put_element(
          @fake_cache_client,
          cache_name,
          12345,
          value,
          score,
          collection_ttl: collection_ttl
        )

      assert String.contains?(error.message, "The sorted set name must be a string")
    end

    test "returns an error with a bad value" do
      cache_name = "cache name"
      sorted_set_name = "sorted set name"
      score = 1.0
      collection_ttl = Momento.Requests.CollectionTtl.of(60.0)

      {:error, error} =
        CacheClient.sorted_set_put_element(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          nil,
          score,
          collection_ttl: collection_ttl
        )

      assert String.contains?(
               error.message,
               "Sorted set elements must contain only binary values and float scores"
             )

      {:error, error} =
        CacheClient.sorted_set_put_element(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          12345,
          score,
          collection_ttl: collection_ttl
        )

      assert String.contains?(
               error.message,
               "Sorted set elements must contain only binary values and float scores"
             )
    end

    test "returns an error with a bad score" do
      cache_name = "cache name"
      sorted_set_name = "sorted set name"
      value = "value"
      collection_ttl = Momento.Requests.CollectionTtl.of(60.0)

      {:error, error} =
        CacheClient.sorted_set_put_element(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          value,
          nil,
          collection_ttl: collection_ttl
        )

      assert String.contains?(
               error.message,
               "Sorted set elements must contain only binary values and float scores"
             )

      {:error, error} =
        CacheClient.sorted_set_put_element(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          value,
          "one",
          collection_ttl: collection_ttl
        )

      assert String.contains?(
               error.message,
               "Sorted set elements must contain only binary values and float scores"
             )
    end

    test "returns an error with a bad collection ttl" do
      cache_name = "cache name"
      sorted_set_name = "sorted set name"
      value = "value"
      score = 1.0

      {:error, error} =
        CacheClient.sorted_set_put_element(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          value,
          score,
          collection_ttl: "ttl"
        )

      assert String.contains?(
               error.message,
               "collection_ttl must be an Elixir.Momento.Requests.CollectionTtl"
             )
    end
  end

  describe "sorted_set_put_elements/5" do
    test "returns an error with a bad cache name" do
      sorted_set_name = "sorted set name"
      elements = [{"key1", 1.0}]
      collection_ttl = Momento.Requests.CollectionTtl.of(60.0)

      {:error, error} =
        CacheClient.sorted_set_put_elements(
          @fake_cache_client,
          nil,
          sorted_set_name,
          elements,
          collection_ttl: collection_ttl
        )

      assert String.contains?(error.message, "The cache name cannot be nil")

      {:error, error} =
        CacheClient.sorted_set_put_elements(
          @fake_cache_client,
          12345,
          sorted_set_name,
          elements,
          collection_ttl: collection_ttl
        )

      assert String.contains?(error.message, "The cache name must be a string")
    end

    test "returns an error with a bad sorted set name" do
      cache_name = "cache name"
      elements = [{"key1", 1.0}]
      collection_ttl = Momento.Requests.CollectionTtl.of(60.0)

      {:error, error} =
        CacheClient.sorted_set_put_elements(
          @fake_cache_client,
          cache_name,
          nil,
          elements,
          collection_ttl: collection_ttl
        )

      assert String.contains?(error.message, "The sorted set name cannot be nil")

      {:error, error} =
        CacheClient.sorted_set_put_elements(
          @fake_cache_client,
          cache_name,
          12345,
          elements,
          collection_ttl: collection_ttl
        )

      assert String.contains?(error.message, "The sorted set name must be a string")
    end

    test "returns an error with bad elements" do
      cache_name = "cache name"
      sorted_set_name = "sorted set name"
      collection_ttl = Momento.Requests.CollectionTtl.of(60.0)

      {:error, error} =
        CacheClient.sorted_set_put_elements(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          nil,
          collection_ttl: collection_ttl
        )

      assert String.contains?(
               error.message,
               "Sorted set elements cannot be nil"
             )

      {:error, error} =
        CacheClient.sorted_set_put_elements(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          [{nil, 1.0}],
          collection_ttl: collection_ttl
        )

      assert String.contains?(
               error.message,
               "Sorted set elements must contain only binary values and float scores"
             )

      {:error, error} =
        CacheClient.sorted_set_put_elements(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          [{12345, 1.0}],
          collection_ttl: collection_ttl
        )

      assert String.contains?(
               error.message,
               "Sorted set elements must contain only binary values and float scores"
             )

      {:error, error} =
        CacheClient.sorted_set_put_elements(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          [{"key1", nil}],
          collection_ttl: collection_ttl
        )

      assert String.contains?(
               error.message,
               "Sorted set elements must contain only binary values and float scores"
             )

      {:error, error} =
        CacheClient.sorted_set_put_elements(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          [{"key1", "one"}],
          collection_ttl: collection_ttl
        )

      assert String.contains?(
               error.message,
               "Sorted set elements must contain only binary values and float scores"
             )
    end

    test "returns an error with a bad collection ttl" do
      cache_name = "cache name"
      sorted_set_name = "sorted set name"
      elements = [{"key1", 1.0}]

      {:error, error} =
        CacheClient.sorted_set_put_elements(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          elements,
          collection_ttl: "ttl"
        )

      assert String.contains?(
               error.message,
               "collection_ttl must be an Elixir.Momento.Requests.CollectionTtl"
             )
    end
  end

  describe "sorted_set_fetch_by_rank/6" do
    test "returns an error with a bad cache name" do
      sorted_set_name = "sorted set name"
      start_rank = 1
      end_rank = 10
      sort_order = :asc

      {:error, error} =
        CacheClient.sorted_set_fetch_by_rank(
          @fake_cache_client,
          nil,
          sorted_set_name,
          start_rank: start_rank,
          end_rank: end_rank,
          sort_order: sort_order
        )

      assert String.contains?(error.message, "The cache name cannot be nil")

      {:error, error} =
        CacheClient.sorted_set_fetch_by_rank(
          @fake_cache_client,
          12345,
          sorted_set_name,
          start_rank: start_rank,
          end_rank: end_rank,
          sort_order: sort_order
        )

      assert String.contains?(error.message, "The cache name must be a string")
    end

    test "returns an error with a bad sorted set name" do
      cache_name = "cache name"
      start_rank = 1
      end_rank = 10
      sort_order = :asc

      {:error, error} =
        CacheClient.sorted_set_fetch_by_rank(
          @fake_cache_client,
          cache_name,
          nil,
          start_rank: start_rank,
          end_rank: end_rank,
          sort_order: sort_order
        )

      assert String.contains?(error.message, "The sorted set name cannot be nil")

      {:error, error} =
        CacheClient.sorted_set_fetch_by_rank(
          @fake_cache_client,
          cache_name,
          12345,
          start_rank: start_rank,
          end_rank: end_rank,
          sort_order: sort_order
        )

      assert String.contains?(error.message, "The sorted set name must be a string")
    end

    test "returns an error with bad ranks" do
      cache_name = "cache name"
      sorted_set_name = "sorted set name"
      sort_order = :asc

      {:error, error} =
        CacheClient.sorted_set_fetch_by_rank(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          start_rank: "start",
          end_rank: 10,
          sort_order: sort_order
        )

      assert String.contains?(error.message, "start is not an integer")

      {:error, error} =
        CacheClient.sorted_set_fetch_by_rank(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          start_rank: 1,
          end_rank: "end",
          sort_order: sort_order
        )

      assert String.contains?(error.message, "end is not an integer")

      {:error, error} =
        CacheClient.sorted_set_fetch_by_rank(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          start_rank: 100,
          end_rank: 10,
          sort_order: sort_order
        )

      assert String.contains?(
               error.message,
               "start_index (inclusive) must be less than end_index (exclusive)"
             )
    end

    test "returns an error with a sort order" do
      cache_name = "cache name"
      sorted_set_name = "sorted set name"
      start_rank = 1
      end_rank = 10

      {:error, error} =
        CacheClient.sorted_set_fetch_by_rank(
          @fake_cache_client,
          cache_name,
          sorted_set_name,
          start_rank: start_rank,
          end_rank: end_rank,
          sort_order: :bad_order
        )

      assert String.contains?(error.message, "The sort order must be either :asc or :desc")
    end
  end
end
