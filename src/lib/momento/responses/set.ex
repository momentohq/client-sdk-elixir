defmodule Momento.Responses.Set do
  defmodule Ok do
    @enforce_keys []
    defstruct []
    @type t() :: %__MODULE__{}
  end

  @type t() :: {:ok, Momento.Responses.Set.Ok.t()} | {:error, Momento.Error.t()}
end
