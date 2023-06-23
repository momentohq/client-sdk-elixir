alias Momento.CacheClient

IO.puts("==Sorted Set Example==")

config = %Momento.Config.Configuration{
  transport_strategy: %Momento.Config.Transport.TransportStrategy{
    grpc_config: %Momento.Config.Transport.GrpcConfiguration{
      deadline_millis: 5000
    }
  }
}

credential_provider = Momento.Auth.CredentialProvider.from_env_var!("MOMENTO_AUTH_TOKEN")
client = CacheClient.create!(config, credential_provider, 60.0)

cache_name = "sorted-set-example"

case CacheClient.create_cache(client, cache_name) do
  {:ok, _} -> :ok
  :already_exists -> :ok
  {:error, error} -> raise error
end

sorted_set_name =
  :crypto.strong_rand_bytes(10)
  |> Base.encode16()
  |> binary_part(0, 10)

initial_elements = for i <- 1..10, do: {"key#{i}", i / 1}

{:ok, _} =
  CacheClient.sorted_set_put_elements(client, cache_name, sorted_set_name, initial_elements)

IO.puts("Sorted set contents:")
{:ok, response} = CacheClient.sorted_set_fetch_by_rank(client, cache_name, sorted_set_name)
IO.inspect(response.value)

IO.puts("Incrementing \"key1\" by 100")

{:ok, _} =
  CacheClient.sorted_set_increment_score(client, cache_name, sorted_set_name, "key1", 100.0)

IO.puts("Removing \"key10\"")
{:ok, _} = CacheClient.sorted_set_remove_element(client, cache_name, sorted_set_name, "key10")

IO.puts("Checking the scores of keys 1 - 3")

{:ok, response} =
  CacheClient.sorted_set_get_scores(client, cache_name, sorted_set_name, ["key1", "key2", "key3"])

IO.inspect(response.value)

IO.puts("Adding new element with a high score")

{:ok, _} =
  CacheClient.sorted_set_put_element(client, cache_name, sorted_set_name, "key11", 10000.0)

IO.puts("Sorted set contents, descending:")

{:ok, response} =
  CacheClient.sorted_set_fetch_by_rank(client, cache_name, sorted_set_name, sort_order: :desc)

IO.inspect(response.value)
