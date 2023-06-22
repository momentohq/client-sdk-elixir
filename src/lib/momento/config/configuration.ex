defmodule Momento.Config.Configuration do
  @moduledoc """
  Configuration for Momento CacheClient
  """
  @enforce_keys [:transport_strategy]
  defstruct [:transport_strategy]

  @opaque t() :: %__MODULE__{
            transport_strategy: Momento.Config.Transport.TransportStrategy.t()
          }

  @spec with_transport_strategy(
          config :: Momento.Config.Configuration.t(),
          transport_strategy :: Momento.Config.Transport.TransportStrategy.t()
        ) :: Momento.Config.Configuration.t()
  def with_transport_strategy(config, transport_strategy) do
    %{config | transport_strategy: transport_strategy}
  end
end
