defmodule Momento.Internal.ScsControlClientTest do
  use ExUnit.Case, async: false
  import Mock

  alias Momento.Internal.ScsControlClient
  alias Momento.Protos.ControlClient.ScsControl.Stub

  test "agent metadata is only sent on the first call" do
    fake_channel = :fake_channel

    client = %ScsControlClient{
      auth_token: "test_token",
      channel: fake_channel
    }

    with_mock Stub, [:passthrough],
      create_cache: fn ^fake_channel, _request, options ->
        metadata = Keyword.get(options, :metadata, %{})
        send(self(), {:grpc_call, metadata})
        {:ok, %{}}
      end do
      ScsControlClient.create_cache(client, "test_cache")
      assert_received {:grpc_call, metadata}
      assert Map.has_key?(metadata, "agent")
      assert Map.has_key?(metadata, "runtime-version")

      ScsControlClient.create_cache(client, "test_cache")
      assert_received {:grpc_call, metadata}
      refute Map.has_key?(metadata, "agent")
      refute Map.has_key?(metadata, "runtime-version")

      ScsControlClient.create_cache(client, "test_cache")
      assert_received {:grpc_call, metadata}
      refute Map.has_key?(metadata, "agent")
      refute Map.has_key?(metadata, "runtime-version")
    end
  end
end
