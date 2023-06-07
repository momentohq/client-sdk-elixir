IO.puts("gRPC Test")

authToken = System.get_env("MOMENTO_AUTH_TOKEN")
metadata = %{cache: "cache", Authorization: authToken}

{:ok, channel} =
  GRPC.Stub.connect("cache.cell-4-us-west-2-1.prod.a.momentohq.com:443",
    cred: GRPC.Credential.new([])
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
