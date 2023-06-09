defmodule Momento.Config.ConfigurationTest do
  alias Momento.Config.Transport.TransportStrategy, as: TransportStrategy
  alias Momento.Config.Transport.GrpcConfiguration, as: GrpcConfiguration

  use ExUnit.Case
  doctest Momento.Config.Configuration

  @test_grpc_configuration %GrpcConfiguration{
    deadline_millis: 90210
  }

  @test_transport_strategy %TransportStrategy{
    grpc_config: @test_grpc_configuration
  }

  @test_configuration %Momento.Config.Configuration{
    transport_strategy: @test_transport_strategy
  }

  describe "Constructing Configuration" do
    test "overriding transport strategy" do
      new_grpc_configuration = %GrpcConfiguration{
        deadline_millis: 424_242
      }

      new_transport_strategy = %TransportStrategy{
        grpc_config: new_grpc_configuration
      }

      new_config =
        Momento.Config.Configuration.with_transport_strategy(
          @test_configuration,
          new_transport_strategy
        )

      assert new_config.transport_strategy == new_transport_strategy
      assert new_config.transport_strategy.grpc_config == new_grpc_configuration
    end
  end
end
