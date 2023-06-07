defmodule CacheClientTest do
  use ExUnit.Case
  doctest Momento.CacheClient

  test "greets the world" do
    assert Momento.CacheClient.hello() == :world
  end
end
