defmodule Momento.Responses.Delete do
  defmodule Ok do
    @enforce_keys []
    defstruct []
    @type t() :: %__MODULE__{}
  end

  @type t() :: {:ok, Momento.Responses.Delete.Ok.t()} | {:error, Momento.Error.t()}
end
