defmodule Momento.Responses.SortedSet.RemoveElements do
  defmodule Ok do
    @enforce_keys []
    defstruct []
    @type t() :: %__MODULE__{}
  end

  @type t() ::
          {:ok, Momento.Responses.SortedSet.RemoveElements.Ok.t()} | {:error, Momento.Error.t()}
end
