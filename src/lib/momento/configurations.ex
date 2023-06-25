defmodule Momento.Configurations do
  defmodule Laptop do
    @spec latest() :: Momento.Config.Configuration.t()
    def latest() do
      %Momento.Config.Configuration{
        transport_strategy: %Momento.Config.Transport.TransportStrategy{
          grpc_config: %Momento.Config.Transport.GrpcConfiguration{
            deadline_millis: 5000
          }
        }
      }
    end
  end

  defmodule InRegion do
    defmodule Default do
      @spec latest() :: Momento.Config.Configuration.t()
      def latest() do
        %Momento.Config.Configuration{
          transport_strategy: %Momento.Config.Transport.TransportStrategy{
            grpc_config: %Momento.Config.Transport.GrpcConfiguration{
              deadline_millis: 1100
            }
          }
        }
      end
    end
  end
end
