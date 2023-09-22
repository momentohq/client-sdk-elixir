alias Momento.CacheClient

config = Momento.Configurations.Laptop.latest()
credential_provider = Momento.Auth.CredentialProvider.from_env_var!("MOMENTO_AUTH_TOKEN")
default_ttl_seconds = 60.0
client = CacheClient.create!(config, credential_provider, default_ttl_seconds)

cache_name = "cache"

case CacheClient.create_cache(client, cache_name) do
  {:ok, _} -> :ok
  :already_exists -> :ok
  {:error, error} -> raise error
end

{:ok, _} = CacheClient.set(client, cache_name, "foo", "bar")

case CacheClient.get(client, cache_name, "foo") do
  {:ok, hit} -> IO.puts("Got value: #{hit.value}")
  :miss -> :ok
  {:error, error} -> raise error
end
