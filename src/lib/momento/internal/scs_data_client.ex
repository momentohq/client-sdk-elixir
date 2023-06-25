defmodule Momento.Internal.ScsDataClient do
  alias Momento.Auth.CredentialProvider
  alias Momento.Responses.{Set, Get, Delete}
  alias Momento.Requests.CollectionTtl
  import Momento.Validation

  @enforce_keys [:auth_token, :channel]
  defstruct [:auth_token, :channel]

  @opaque t() :: %__MODULE__{
            auth_token: String.t(),
            channel: GRPC.Channel.t()
          }

  defimpl Inspect, for: Momento.Internal.ScsDataClient do
    def inspect(%Momento.Internal.ScsDataClient{} = data_client, _opts) do
      "#Momento.Internal.ScsDataClient<auth_token: [hidden], channel: #{inspect(data_client.channel)}>"
    end
  end

  @spec create(CredentialProvider.t()) :: {:ok, t()} | {:error, any()}
  def create(credential_provider) do
    cache_endpoint = CredentialProvider.cache_endpoint(credential_provider)
    tls_options = :tls_certificate_check.options(cache_endpoint)

    with {:ok, channel} <-
           GRPC.Stub.connect(cache_endpoint <> ":443",
             cred: GRPC.Credential.new(ssl: tls_options)
           ) do
      {:ok,
       %__MODULE__{
         auth_token: CredentialProvider.auth_token(credential_provider),
         channel: channel
       }}
    end
  end

  @spec set(
          data_client :: t(),
          cache_name :: String.t(),
          key :: binary(),
          value :: binary(),
          ttl_seconds :: number()
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
          {:ok, %Get.Hit{value: cache_body}}

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

  @spec sorted_set_put_elements(
          data_client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          elements :: %{binary() => number()} | [{binary(), number()}],
          collection_ttl :: CollectionTtl.t()
        ) :: Momento.Responses.SortedSet.PutElements.t()
  def sorted_set_put_elements(
        data_client,
        cache_name,
        sorted_set_name,
        elements,
        collection_ttl
      ) do
    with :ok <- validate_cache_name(cache_name),
         :ok <- validate_sorted_set_name(sorted_set_name),
         :ok <- validate_sorted_set_elements(elements),
         :ok <- validate_collection_ttl(collection_ttl) do
      try do
        send_sorted_set_put_elements(
          data_client,
          cache_name,
          sorted_set_name,
          elements,
          collection_ttl
        )
      rescue
        e -> {:error, Momento.Error.convert(e)}
      end
    else
      error -> error
    end
  end

  @spec send_sorted_set_put_elements(
          data_client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          elements :: %{binary() => number()} | [{binary(), number()}],
          collection_ttl :: CollectionTtl.t()
        ) :: Momento.Responses.SortedSet.PutElements.t()
  defp send_sorted_set_put_elements(
         data_client,
         cache_name,
         sorted_set_name,
         elements,
         collection_ttl
       ) do
    ttl_milliseconds = collection_ttl.ttl_seconds |> Kernel.*(1000) |> round()
    metadata = %{cache: cache_name, Authorization: data_client.auth_token}

    transformed_elements =
      Enum.map(elements, fn {value, score} ->
        %Momento.Protos.CacheClient.SortedSetElement{
          value: value,
          score: score
        }
      end)

    sorted_set_put_request = %Momento.Protos.CacheClient.SortedSetPutRequest{
      set_name: sorted_set_name,
      elements: transformed_elements,
      ttl_milliseconds: ttl_milliseconds,
      refresh_ttl: collection_ttl.refresh_ttl
    }

    case Momento.Protos.CacheClient.Scs.Stub.sorted_set_put(
           data_client.channel,
           sorted_set_put_request,
           metadata: metadata
         ) do
      {:ok, _} -> {:ok, %Momento.Responses.SortedSet.PutElements.Ok{}}
      {:error, error_response} -> {:error, Momento.Error.convert(error_response)}
    end
  end

  @spec sorted_set_fetch_by_rank(
          data_client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          start_rank :: integer() | nil,
          end_rank :: integer() | nil,
          sort_order :: :asc | :desc
        ) :: Momento.Responses.SortedSet.Fetch.t()
  def sorted_set_fetch_by_rank(
        data_client,
        cache_name,
        sorted_set_name,
        start_rank \\ nil,
        end_rank \\ nil,
        sort_order \\ :asc
      ) do
    with :ok <- validate_cache_name(cache_name),
         :ok <- validate_sorted_set_name(sorted_set_name),
         :ok <- validate_index_range(start_rank, end_rank),
         :ok <- validate_sort_order(sort_order) do
      try do
        send_sorted_set_fetch_by_rank(
          data_client,
          cache_name,
          sorted_set_name,
          start_rank,
          end_rank,
          sort_order
        )
      rescue
        e -> {:error, Momento.Error.convert(e)}
      end
    else
      error -> error
    end
  end

  @spec send_sorted_set_fetch_by_rank(
          data_client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          start_rank :: integer() | nil,
          end_rank :: integer() | nil,
          sort_order :: :asc | :desc
        ) :: Momento.Responses.SortedSet.Fetch.t()
  defp send_sorted_set_fetch_by_rank(
         data_client,
         cache_name,
         sorted_set_name,
         start_rank,
         end_rank,
         sort_order
       ) do
    metadata = %{cache: cache_name, Authorization: data_client.auth_token}

    start_index =
      case start_rank do
        nil -> {:unbounded_start, %Momento.Protos.CacheClient.Unbounded{}}
        _ -> {:inclusive_start_index, start_rank}
      end

    end_index =
      case end_rank do
        nil -> {:unbounded_end, %Momento.Protos.CacheClient.Unbounded{}}
        _ -> {:exclusive_end_index, end_rank}
      end

    order =
      case sort_order do
        :asc -> 0
        _ -> 1
      end

    fetch_request = %Momento.Protos.CacheClient.SortedSetFetchRequest{
      set_name: sorted_set_name,
      order: order,
      with_scores: true,
      range:
        {:by_index,
         %Momento.Protos.CacheClient.SortedSetFetchRequest.ByIndex{
           start: start_index,
           end: end_index
         }}
    }

    case Momento.Protos.CacheClient.Scs.Stub.sorted_set_fetch(
           data_client.channel,
           fetch_request,
           metadata: metadata
         ) do
      {:ok, response} ->
        case response.sorted_set do
          {:found, found} ->
            {:values_with_scores, values_with_scores} = found.elements

            scored_values =
              Enum.map(values_with_scores.elements, fn element ->
                {element.value, element.score}
              end)

            {:ok, %Momento.Responses.SortedSet.Fetch.Hit{value: scored_values}}

          {:missing, _} ->
            :miss
        end

      {:error, error_response} ->
        {:error, Momento.Error.convert(error_response)}
    end
  end

  @spec sorted_set_fetch_by_score(
          data_client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          min_score :: number() | nil,
          max_score :: number() | nil,
          offset :: integer() | nil,
          count :: integer() | nil,
          sort_order :: :asc | :desc
        ) :: Momento.Responses.SortedSet.Fetch.t()
  def sorted_set_fetch_by_score(
        data_client,
        cache_name,
        sorted_set_name,
        min_score,
        max_score,
        offset,
        count,
        sort_order
      ) do
    with :ok <- validate_cache_name(cache_name),
         :ok <- validate_sorted_set_name(sorted_set_name) do
      try do
        send_sorted_set_fetch_by_score(
          data_client,
          cache_name,
          sorted_set_name,
          min_score,
          max_score,
          offset,
          count,
          sort_order
        )
      rescue
        e -> {:error, Momento.Error.convert(e)}
      end
    else
      error -> error
    end
  end

  @spec send_sorted_set_fetch_by_score(
          data_client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          min_score :: number() | nil,
          max_score :: number() | nil,
          offset :: integer() | nil,
          count :: integer() | nil,
          sort_order :: :asc | :desc
        ) :: Momento.Responses.SortedSet.Fetch.t()
  defp send_sorted_set_fetch_by_score(
         data_client,
         cache_name,
         sorted_set_name,
         min_score,
         max_score,
         offset,
         count,
         sort_order
       ) do
    metadata = %{cache: cache_name, Authorization: data_client.auth_token}

    request_min_score =
      case min_score do
        nil ->
          {:unbounded_min, %Momento.Protos.CacheClient.Unbounded{}}

        _ ->
          {:min_score,
           %Momento.Protos.CacheClient.SortedSetFetchRequest.ByScore.Score{
             score: min_score,
             exclusive: false
           }}
      end

    request_max_score =
      case max_score do
        nil ->
          {:unbounded_max, %Momento.Protos.CacheClient.Unbounded{}}

        _ ->
          {:max_score,
           %Momento.Protos.CacheClient.SortedSetFetchRequest.ByScore.Score{
             score: max_score,
             exclusive: false
           }}
      end

    request_offset =
      case offset do
        nil -> 0
        _ -> offset
      end

    request_count =
      case count do
        nil -> -1
        _ -> count
      end

    request_order =
      case sort_order do
        :asc -> 0
        _ -> 1
      end

    fetch_request = %Momento.Protos.CacheClient.SortedSetFetchRequest{
      set_name: sorted_set_name,
      order: request_order,
      with_scores: true,
      range:
        {:by_score,
         %Momento.Protos.CacheClient.SortedSetFetchRequest.ByScore{
           min: request_min_score,
           max: request_max_score,
           offset: request_offset,
           count: request_count
         }}
    }

    case Momento.Protos.CacheClient.Scs.Stub.sorted_set_fetch(
           data_client.channel,
           fetch_request,
           metadata: metadata
         ) do
      {:ok, response} ->
        case response.sorted_set do
          {:found, found} ->
            {:values_with_scores, values_with_scores} = found.elements

            scored_values =
              Enum.map(values_with_scores.elements, fn element ->
                {element.value, element.score}
              end)

            {:ok, %Momento.Responses.SortedSet.Fetch.Hit{value: scored_values}}

          {:missing, _} ->
            :miss
        end

      {:error, error_response} ->
        {:error, Momento.Error.convert(error_response)}
    end
  end

  @spec sorted_set_remove_elements(
          data_client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          values :: [binary()]
        ) :: Momento.Responses.SortedSet.RemoveElements.t()
  def sorted_set_remove_elements(
        data_client,
        cache_name,
        sorted_set_name,
        values
      ) do
    with :ok <- validate_cache_name(cache_name),
         :ok <- validate_sorted_set_name(sorted_set_name) do
      try do
        send_sorted_set_remove_elements(
          data_client,
          cache_name,
          sorted_set_name,
          values
        )
      rescue
        e -> {:error, Momento.Error.convert(e)}
      end
    else
      error -> error
    end
  end

  @spec send_sorted_set_remove_elements(
          data_client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          values :: [binary()]
        ) :: Momento.Responses.SortedSet.RemoveElements.t()
  defp send_sorted_set_remove_elements(
         data_client,
         cache_name,
         sorted_set_name,
         values
       ) do
    metadata = %{cache: cache_name, Authorization: data_client.auth_token}

    remove_request = %Momento.Protos.CacheClient.SortedSetRemoveRequest{
      set_name: sorted_set_name,
      remove_elements:
        {:some, %Momento.Protos.CacheClient.SortedSetRemoveRequest.Some{values: values}}
    }

    case Momento.Protos.CacheClient.Scs.Stub.sorted_set_remove(
           data_client.channel,
           remove_request,
           metadata: metadata
         ) do
      {:ok, _} ->
        {:ok, %Momento.Responses.SortedSet.RemoveElements.Ok{}}

      {:error, error} ->
        {:error, Momento.Error.convert(error)}
    end
  end

  @spec sorted_set_get_rank(
          data_client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          value :: binary(),
          sort_order :: :asc | :desc
        ) :: Momento.Responses.SortedSet.GetRank.t()
  def sorted_set_get_rank(
        data_client,
        cache_name,
        sorted_set_name,
        value,
        sort_order
      ) do
    with :ok <- validate_cache_name(cache_name),
         :ok <- validate_sorted_set_name(sorted_set_name) do
      try do
        metadata = %{cache: cache_name, Authorization: data_client.auth_token}

        request_order =
          case sort_order do
            :asc -> 0
            _ -> 1
          end

        get_rank_request = %Momento.Protos.CacheClient.SortedSetGetRankRequest{
          set_name: sorted_set_name,
          value: value,
          order: request_order
        }

        case Momento.Protos.CacheClient.Scs.Stub.sorted_set_get_rank(
               data_client.channel,
               get_rank_request,
               metadata: metadata
             ) do
          {:ok, response} ->
            case response do
              %Momento.Protos.CacheClient.SortedSetGetRankResponse{
                rank:
                  {:element_rank,
                   %Momento.Protos.CacheClient.SortedSetGetRankResponse.RankResponsePart{
                     result: :Hit,
                     rank: rank
                   }}
              } ->
                {:ok, %Momento.Responses.SortedSet.GetRank.Hit{rank: rank}}

              %Momento.Protos.CacheClient.SortedSetGetRankResponse{
                rank:
                  {:element_rank,
                   %Momento.Protos.CacheClient.SortedSetGetRankResponse.RankResponsePart{
                     result: :Miss
                   }}
              } ->
                :miss

              %Momento.Protos.CacheClient.SortedSetGetRankResponse{
                rank:
                  {:missing,
                   %Momento.Protos.CacheClient.SortedSetGetRankResponse.SortedSetMissing{}}
              } ->
                :miss
            end

          {:error, error} ->
            {:error, Momento.Error.convert(error)}
        end
      rescue
        e -> {:error, Momento.Error.convert(e)}
      end
    else
      error -> error
    end
  end

  @spec sorted_set_get_score(
          data_client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          value :: binary()
        ) :: Momento.Responses.SortedSet.GetScore.t()
  def sorted_set_get_score(
        data_client,
        cache_name,
        sorted_set_name,
        value
      ) do
    try do
      case sorted_set_get_scores(
             data_client,
             cache_name,
             sorted_set_name,
             [value]
           ) do
        {:ok, %Momento.Responses.SortedSet.GetScores.Hit{value: values}} ->
          case values do
            [] ->
              :miss

            _ ->
              case Enum.find(values, fn {key, _} -> key == value end) do
                nil ->
                  :miss

                {_, score} ->
                  case score do
                    nil -> :miss
                    _ -> {:ok, %Momento.Responses.SortedSet.GetScore.Hit{score: score}}
                  end
              end
          end

        :miss ->
          :miss

        {:error, error} ->
          {:error, error}
      end
    rescue
      e -> {:error, Momento.Error.convert(e)}
    end
  end

  @spec sorted_set_get_scores(
          data_client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          values :: [binary()]
        ) :: Momento.Responses.SortedSet.GetScores.t()
  def sorted_set_get_scores(
        data_client,
        cache_name,
        sorted_set_name,
        values
      ) do
    with :ok <- validate_cache_name(cache_name),
         :ok <- validate_sorted_set_name(sorted_set_name) do
      try do
        metadata = %{cache: cache_name, Authorization: data_client.auth_token}

        get_scores_request = %Momento.Protos.CacheClient.SortedSetGetScoreRequest{
          set_name: sorted_set_name,
          values: values
        }

        case Momento.Protos.CacheClient.Scs.Stub.sorted_set_get_score(
               data_client.channel,
               get_scores_request,
               metadata: metadata
             ) do
          {:ok, response} ->
            case response do
              %Momento.Protos.CacheClient.SortedSetGetScoreResponse{
                sorted_set:
                  {:found,
                   %Momento.Protos.CacheClient.SortedSetGetScoreResponse.SortedSetFound{
                     elements: elements
                   }}
              } ->
                values_to_scores =
                  Enum.zip(values, elements)
                  |> Enum.map(fn {value, element} ->
                    case element.result do
                      :Hit -> {value, element.score}
                      :Miss -> {value, nil}
                    end
                  end)

                {:ok, %Momento.Responses.SortedSet.GetScores.Hit{value: values_to_scores}}

              %Momento.Protos.CacheClient.SortedSetGetScoreResponse{
                sorted_set:
                  {:missing,
                   %Momento.Protos.CacheClient.SortedSetGetScoreResponse.SortedSetMissing{}}
              } ->
                :miss
            end

          {:error, error} ->
            {:error, Momento.Error.convert(error)}
        end
      rescue
        e -> {:error, Momento.Error.convert(e)}
      end
    else
      error -> error
    end
  end

  @spec sorted_set_increment_score(
          data_client :: t(),
          cache_name :: String.t(),
          sorted_set_name :: String.t(),
          value :: binary(),
          amount :: number(),
          collection_ttl :: CollectionTtl.t()
        ) :: Momento.Responses.SortedSet.IncrementScore.t()
  def sorted_set_increment_score(
        data_client,
        cache_name,
        sorted_set_name,
        value,
        amount,
        collection_ttl
      ) do
    with :ok <- validate_cache_name(cache_name),
         :ok <- validate_sorted_set_name(sorted_set_name) do
      try do
        ttl_milliseconds = collection_ttl.ttl_seconds |> Kernel.*(1000) |> round()
        metadata = %{cache: cache_name, Authorization: data_client.auth_token}

        increment_request = %Momento.Protos.CacheClient.SortedSetIncrementRequest{
          set_name: sorted_set_name,
          value: value,
          amount: amount,
          ttl_milliseconds: ttl_milliseconds,
          refresh_ttl: collection_ttl.refresh_ttl
        }

        case Momento.Protos.CacheClient.Scs.Stub.sorted_set_increment(
               data_client.channel,
               increment_request,
               metadata: metadata
             ) do
          {:ok, response} ->
            {:ok, %Momento.Responses.SortedSet.IncrementScore.Ok{score: response.score}}

          {:error, error} ->
            {:error, Momento.Error.convert(error)}
        end
      rescue
        e -> {:error, Momento.Error.convert(e)}
      end
    else
      error -> error
    end
  end
end
