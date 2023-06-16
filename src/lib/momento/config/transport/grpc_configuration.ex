defmodule Momento.Config.Transport.GrpcConfiguration do
  @moduledoc """
  Encapsulates gRPC configuration tunables.
  """
  @enforce_keys [:deadline_millis]
  defstruct [:deadline_millis]

  @opaque t() :: %__MODULE__{
            deadline_millis: number()
          }
end
