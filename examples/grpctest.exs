IO.puts("gRPC Test")

credential_provider = Momento.Auth.CredentialProvider.from_env_var!("MOMENTO_AUTH_TOKEN")
metadata = %{cache: "cache", Authorization: credential_provider.auth_token}

IO.inspect(credential_provider.cache_endpoint)

options = :tls_certificate_check.options(credential_provider.cache_endpoint)

{:ok, channel} =
  GRPC.Stub.connect(credential_provider.cache_endpoint <> ":443",
    cred: GRPC.Credential.new(ssl: options)
  )

IO.puts("Setting key 'key' in cache 'cache'")

setRequest = %CacheClient.SetRequest{
  cache_key: "key",
  cache_body: "value",
  ttl_milliseconds: 60000
}

{:ok, setResponse} = CacheClient.Scs.Stub.set(channel, setRequest, metadata: metadata)

IO.inspect(setResponse)

IO.puts("Getting key 'key' from cache 'cache'")
getRequest = %CacheClient.GetRequest{cache_key: "key"}

{:ok, getResponse} = CacheClient.Scs.Stub.get(channel, getRequest, metadata: metadata)

IO.inspect(getResponse)
