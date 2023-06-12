defmodule Momento.Config.Transport.TransportStrategy do
  alias Momento.Config.Transport.TransportStrategy, as: TransportStrategy
  alias Momento.Config.Transport.GrpcConfiguration, as: GrpcConfiguration

  @moduledoc """
  Configuration for the low-level Momento transport layer
  """
  @enforce_keys [:grpc_config]
  defstruct [:grpc_config]

  @opaque t() :: %__MODULE__{
            grpc_config: GrpcConfiguration.t()
          }

  @doc """
  Copy constructor for overriding the gRPC configuration
  """
  @spec with_grpc_config(
          transport_strategy :: TransportStrategy.t(),
          grpc_config :: GrpcConfiguration.t()
        ) :: TransportStrategy.t()
  def with_grpc_config(transport_strategy, grpc_config) do
    %TransportStrategy{
      grpc_config: grpc_config
    }
  end
end
