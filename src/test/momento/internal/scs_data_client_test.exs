defmodule Momento.Internal.ScsDataClientTest do
  use ExUnit.Case, async: false
  import Mock

  alias Momento.Internal.ScsDataClient
  alias Momento.Protos.CacheClient.Scs.Stub

  test "agent metadata is only sent on the first call" do
    fake_channel = :fake_channel

    client = %ScsDataClient{
      auth_token: "test_token",
      channel: fake_channel
    }

    with_mock Stub, [:passthrough],
      set: fn ^fake_channel, _request, options ->
        metadata = Keyword.get(options, :metadata, %{})
        send(self(), {:grpc_call, metadata})
        {:ok, %{}}
      end do
      ScsDataClient.set(client, "test_cache", "key1", "value1", 60)
      assert_received {:grpc_call, metadata}
      assert Map.has_key?(metadata, "agent")
      assert Map.has_key?(metadata, "runtime-version")

      ScsDataClient.set(client, "test_cache", "key2", "value2", 60)
      assert_received {:grpc_call, metadata}
      refute Map.has_key?(metadata, "agent")
      refute Map.has_key?(metadata, "runtime-version")

      ScsDataClient.set(client, "test_cache", "key3", "value3", 60)
      assert_received {:grpc_call, metadata}
      refute Map.has_key?(metadata, "agent")
      refute Map.has_key?(metadata, "runtime-version")
    end
  end
end
