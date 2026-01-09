defmodule Examples.DocExamples do
  @fake_api_key_v1 "eyJhcGlfa2V5IjogImV5SjBlWEFpT2lKS1YxUWlMQ0poYkdjaU9pSklVekkxTmlKOS5leUpwYzNNaU9pS" <>
                     "lBibXhwYm1VZ1NsZFVJRUoxYVd4a1pYSWlMQ0pwWVhRaU9qRTJOemd6TURVNE1USXNJbVY0Y0NJNk5E" <>
                     "ZzJOVFV4TlRReE1pd2lZWFZrSWpvaUlpd2ljM1ZpSWpvaWFuSnZZMnRsZEVCbGVHRnRjR3hsTG1OdmJ" <>
                     "TSjkuOEl5OHE4NExzci1EM1lDb19IUDRkLXhqSGRUOFVDSXV2QVljeGhGTXl6OCIsICJlbmRwb2ludC" <>
                     "I6ICJ0ZXN0Lm1vbWVudG9ocS5jb20ifQo="

  @fake_api_key_v2 "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9" <>
                     ".eyJ0IjoiZyIsImp0aSI6InNvbWUtaWQifQ" <>
                     ".GMr9nA6HE0ttB6llXct_2Sg5-fOKGFbJCdACZFgNbN1fhT6OPg_hVc8ThGzBrWC_RlsBpLA1nzqK3SOJDXYxAw"

  @spec retrieve_api_key_from_your_secrets_manager() :: String.t()
  def retrieve_api_key_from_your_secrets_manager() do
    @fake_api_key_v1
  end

  @spec retrieve_api_key_v2_from_your_secrets_manager() :: String.t()
  def retrieve_api_key_v2_from_your_secrets_manager() do
    @fake_api_key_v2
  end

  @spec example_API_CredentialProviderFromEnvVar() :: Momento.Auth.CredentialProvider.t()
  def example_API_CredentialProviderFromEnvVar() do
    Momento.Auth.CredentialProvider.from_env_var!("MOMENTO_API_KEY")
  end

  @spec example_API_CredentialProviderFromEnvVarV2() :: Momento.Auth.CredentialProvider.t()
  def example_API_CredentialProviderFromEnvVarV2() do
    Momento.Auth.CredentialProvider.from_env_var_v2!("MOMENTO_API_KEY", "MOMENTO_ENDPOINT")
  end

  @spec example_API_CredentialProviderFromEnvVarV2Default() :: Momento.Auth.CredentialProvider.t()
  def example_API_CredentialProviderFromEnvVarV2Default() do
    Momento.Auth.CredentialProvider.from_env_var_v2!()
  end

  @spec example_API_CredentialProviderFromString() :: Momento.Auth.CredentialProvider.t()
  def example_API_CredentialProviderFromString() do
    api_key = retrieve_api_key_from_your_secrets_manager()
    Momento.Auth.CredentialProvider.from_string!(api_key)
  end

  @spec example_API_CredentialProviderFromApiKeyV2() :: Momento.Auth.CredentialProvider.t()
  def example_API_CredentialProviderFromApiKeyV2() do
    api_key = retrieve_api_key_v2_from_your_secrets_manager()
    endpoint = "cell-4-us-west-2-1.prod.a.momentohq.com"
    Momento.Auth.CredentialProvider.from_api_key_v2!(api_key, endpoint)
  end

  @spec example_API_CredentialProviderFromDisposableToken() :: Momento.Auth.CredentialProvider.t()
  def example_API_CredentialProviderFromDisposableToken() do
    api_key = retrieve_api_key_from_your_secrets_manager()
    Momento.Auth.CredentialProvider.from_disposable_token!(api_key)
  end

  @spec example_API_InstantiateCacheClient() :: Momento.CacheClient.t()
  def example_API_InstantiateCacheClient() do
    config = Momento.Configurations.Laptop.latest()

    credential_provider = Momento.Auth.CredentialProvider.from_env_var_v2!()
    default_ttl_seconds = 60.0
    Momento.CacheClient.create!(config, credential_provider, default_ttl_seconds)
  end

  @spec example_API_ErrorHandlingHitMiss(client :: Momento.CacheClient.t()) :: any()
  def example_API_ErrorHandlingHitMiss(client) do
    case Momento.CacheClient.get(client, "test-cache", "test-key") do
      {:ok, hit} ->
        IO.puts("Retrieved value for key 'test-key': #{hit.value}")

      :miss ->
        IO.puts("Key 'test-key' was not found in cache 'test-cache'")

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to get key 'test-key' from cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_ErrorHandlingSuccess(client :: Momento.CacheClient.t()) :: any()
  def example_API_ErrorHandlingSuccess(client) do
    case Momento.CacheClient.set(client, "test-cache", "test-key", "test-value") do
      {:ok, _} ->
        IO.puts("Key 'test-key' stored successfully")

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to store key 'test-key' in cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_CreateCache(client :: Momento.CacheClient.t()) :: any()
  def example_API_CreateCache(client) do
    case Momento.CacheClient.create_cache(client, "test-cache") do
      {:ok, _} ->
        IO.puts("Cache 'test-cache' created")

      :already_exists ->
        :ok

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to create cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_DeleteCache(client :: Momento.CacheClient.t()) :: any()
  def example_API_DeleteCache(client) do
    case Momento.CacheClient.delete_cache(client, "test-cache") do
      {:ok, _} ->
        IO.puts("Cache 'test-cache' deleted")

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to delete cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_ListCaches(client :: Momento.CacheClient.t()) :: any()
  def example_API_ListCaches(client) do
    case Momento.CacheClient.list_caches(client) do
      {:ok, result} ->
        IO.puts("Caches:")
        IO.inspect(result.caches)

      {:error, error} ->
        IO.puts("An error occurred while attempting to list caches: #{error.error_code}")
        raise error
    end
  end

  @spec example_API_Set(client :: Momento.CacheClient.t()) :: any()
  def example_API_Set(client) do
    case Momento.CacheClient.set(client, "test-cache", "test-key", "test-value") do
      {:ok, _} ->
        IO.puts("Key 'test-key' stored successfully")

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to store key 'test-key' in cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_Get(client :: Momento.CacheClient.t()) :: any()
  def example_API_Get(client) do
    case Momento.CacheClient.get(client, "test-cache", "test-key") do
      {:ok, hit} ->
        IO.puts("Retrieved value for key 'test-key': #{hit.value}")

      :miss ->
        IO.puts("Key 'test-key' was not found in cache 'test-cache'")

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to get key 'test-key' from cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_Delete(client :: Momento.CacheClient.t()) :: any()
  def example_API_Delete(client) do
    case Momento.CacheClient.delete(client, "test-cache", "test-key") do
      {:ok, _} ->
        IO.puts("Key 'test-key' deleted successfully")

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to delete key 'test-key' from cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_SortedSetPutElement(client :: Momento.CacheClient.t()) :: any()
  def example_API_SortedSetPutElement(client) do
    case Momento.CacheClient.sorted_set_put_element(
           client,
           "test-cache",
           "test-sorted-set",
           "test-value",
           5.0
         ) do
      {:ok, _} ->
        IO.puts(
          "Value 'test-value' with score '5' added successfully to sorted set 'test-sorted-set'"
        )

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to put an element into sorted set 'test-sorted-set' in cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_SortedSetPutElements(client :: Momento.CacheClient.t()) :: any()
  def example_API_SortedSetPutElements(client) do
    case Momento.CacheClient.sorted_set_put_elements(client, "test-cache", "test-sorted-set", [
           {"key1", 10.0},
           {"key2", 20.0}
         ]) do
      {:ok, _} ->
        IO.puts("Elements added successfully to sorted set 'test-sorted-set'")

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to put elements into sorted set 'test-sorted-set' in cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_SortedSetFetchByRank(client :: Momento.CacheClient.t()) :: any()
  def example_API_SortedSetFetchByRank(client) do
    {:ok, _} =
      Momento.CacheClient.sorted_set_put_elements(client, "test-cache", "test-sorted-set", [
        {"key1", 10.0},
        {"key2", 20.0}
      ])

    case Momento.CacheClient.sorted_set_fetch_by_rank(client, "test-cache", "test-sorted-set") do
      {:ok, hit} ->
        IO.puts("Values from sorted set 'test-sorted-set' fetched by rank successfully:")
        IO.inspect(hit.value)

      :miss ->
        IO.puts("Sorted Set 'test-sorted-set' was not found in cache 'test-cache'")

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to fetch by rank on sorted set 'test-sorted-set' in cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_SortedSetFetchByScore(client :: Momento.CacheClient.t()) :: any()
  def example_API_SortedSetFetchByScore(client) do
    {:ok, _} =
      Momento.CacheClient.sorted_set_put_elements(client, "test-cache", "test-sorted-set", [
        {"key1", 10.0},
        {"key2", 20.0}
      ])

    case Momento.CacheClient.sorted_set_fetch_by_score(client, "test-cache", "test-sorted-set") do
      {:ok, hit} ->
        IO.puts("Values from sorted set 'test-sorted-set' fetched by score successfully:")
        IO.inspect(hit.value)

      :miss ->
        IO.puts("Sorted Set 'test-sorted-set' was not found in cache 'test-cache'")

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to fetch by score on sorted set 'test-sorted-set' in cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_SortedSetGetRank(client :: Momento.CacheClient.t()) :: any()
  def example_API_SortedSetGetRank(client) do
    {:ok, _} =
      Momento.CacheClient.sorted_set_put_elements(client, "test-cache", "test-sorted-set", [
        {"key1", 10.0},
        {"key2", 20.0}
      ])

    case Momento.CacheClient.sorted_set_get_rank(client, "test-cache", "test-sorted-set", "key1") do
      {:ok, hit} ->
        IO.puts("Element with value 'key1' has rank: #{hit.rank}")

      :miss ->
        IO.puts(
          "Value 'key1' not found in sorted set, or sorted set 'test-sorted-set' was not found in cache 'test-cache'"
        )

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to get the rank of 'key1' in sorted set 'test-sorted-set' in cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_SortedSetGetScore(client :: Momento.CacheClient.t()) :: any()
  def example_API_SortedSetGetScore(client) do
    {:ok, _} =
      Momento.CacheClient.sorted_set_put_elements(client, "test-cache", "test-sorted-set", [
        {"key1", 10.0},
        {"key2", 20.0}
      ])

    case Momento.CacheClient.sorted_set_get_score(client, "test-cache", "test-sorted-set", "key1") do
      {:ok, hit} ->
        IO.puts("Element with value 'key1' has score: #{hit.score}")

      :miss ->
        IO.puts(
          "Value 'key1' not found in sorted set, or sorted set 'test-sorted-set' was not found in cache 'test-cache'"
        )

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to get the score of 'key1' in sorted set 'test-sorted-set' in cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_SortedSetGetScores(client :: Momento.CacheClient.t()) :: any()
  def example_API_SortedSetGetScores(client) do
    {:ok, _} =
      Momento.CacheClient.sorted_set_put_elements(client, "test-cache", "test-sorted-set", [
        {"key1", 10.0},
        {"key2", 20.0}
      ])

    case Momento.CacheClient.sorted_set_get_scores(client, "test-cache", "test-sorted-set", [
           "key1",
           "key2"
         ]) do
      {:ok, hit} ->
        IO.puts("Element scores retrieved successfully:")
        IO.inspect(hit.value)

      :miss ->
        IO.puts("Sorted Set 'test-sorted-set' was not found in cache 'test-cache'")

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to get the scores of values in sorted set 'test-sorted-set' in cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_SortedSetIncrementScore(client :: Momento.CacheClient.t()) :: any()
  def example_API_SortedSetIncrementScore(client) do
    case Momento.CacheClient.sorted_set_increment_score(
           client,
           "test-cache",
           "test-sorted-set",
           "key1",
           1
         ) do
      {:ok, result} ->
        IO.puts("Score for value 'key1' incremented successfully. New score: #{result.score}")

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to increment the score of 'key1' in sorted set 'test-sorted-set' in cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_SortedSetRemoveElement(client :: Momento.CacheClient.t()) :: any()
  def example_API_SortedSetRemoveElement(client) do
    {:ok, _} =
      Momento.CacheClient.sorted_set_put_element(
        client,
        "test-cache",
        "test-sorted-set",
        "key1",
        10.0
      )

    case Momento.CacheClient.sorted_set_remove_element(
           client,
           "test-cache",
           "test-sorted-set",
           "key1"
         ) do
      {:ok, _} ->
        IO.puts("Element with value 'key1' removed successfully")

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting to remove value 'key1' from sorted set 'test-sorted-set' in cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end

  @spec example_API_SortedSetRemoveElements(client :: Momento.CacheClient.t()) :: any()
  def example_API_SortedSetRemoveElements(client) do
    {:ok, _} =
      Momento.CacheClient.sorted_set_put_elements(client, "test-cache", "test-sorted-set", [
        {"key1", 10.0},
        {"key2", 20.0}
      ])

    case Momento.CacheClient.sorted_set_remove_elements(client, "test-cache", "test-sorted-set", [
           "key1",
           "key2"
         ]) do
      {:ok, _} ->
        IO.puts("Elements with value 'key1' and 'key2' removed successfully")

      {:error, error} ->
        IO.puts(
          "An error occurred while attempting remove values from sorted set 'test-sorted-set' in cache 'test-cache': #{error.error_code}"
        )

        raise error
    end
  end
end

Examples.DocExamples.example_API_CredentialProviderFromEnvVar()
Examples.DocExamples.example_API_CredentialProviderFromEnvVarV2()
Examples.DocExamples.example_API_CredentialProviderFromEnvVarV2Default()
Examples.DocExamples.example_API_CredentialProviderFromString()
Examples.DocExamples.example_API_CredentialProviderFromApiKeyV2()
Examples.DocExamples.example_API_CredentialProviderFromDisposableToken()

client = Examples.DocExamples.example_API_InstantiateCacheClient()

Examples.DocExamples.example_API_CreateCache(client)
Examples.DocExamples.example_API_DeleteCache(client)
Examples.DocExamples.example_API_CreateCache(client)

Examples.DocExamples.example_API_ErrorHandlingHitMiss(client)
Examples.DocExamples.example_API_ErrorHandlingSuccess(client)

Examples.DocExamples.example_API_ListCaches(client)
Examples.DocExamples.example_API_Set(client)
Examples.DocExamples.example_API_Get(client)
Examples.DocExamples.example_API_Delete(client)
Examples.DocExamples.example_API_SortedSetPutElement(client)
Examples.DocExamples.example_API_SortedSetPutElements(client)
Examples.DocExamples.example_API_SortedSetFetchByRank(client)
Examples.DocExamples.example_API_SortedSetFetchByScore(client)
Examples.DocExamples.example_API_SortedSetGetRank(client)
Examples.DocExamples.example_API_SortedSetGetScore(client)
Examples.DocExamples.example_API_SortedSetGetScores(client)
Examples.DocExamples.example_API_SortedSetIncrementScore(client)
Examples.DocExamples.example_API_SortedSetRemoveElement(client)
Examples.DocExamples.example_API_SortedSetRemoveElements(client)
