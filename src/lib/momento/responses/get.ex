defmodule Momento.Responses.Get do
  defmodule Hit do
    @enforce_keys [:value]
    defstruct [:value]

    @type t() :: %__MODULE__{
            value: binary
          }
  end

  @type t() :: {:ok, Momento.Responses.Get.Hit.t()} | :miss | {:error, Momento.Error.t()}
end
