defmodule Momento.Responses.SortedSet.PutElements do
  defmodule Ok do
    @enforce_keys []
    defstruct []
    @type t() :: %__MODULE__{}
  end

  @type t() :: {:ok, Momento.Responses.SortedSet.PutElements.Ok.t()} | {:error, Momento.Error.t()}
end
