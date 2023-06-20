defmodule Momento.Responses.SortedSet.RemoveElement do
  defmodule Ok do
    @enforce_keys []
    defstruct []
    @type t() :: %__MODULE__{}
  end

  @type t() ::
          {:ok, Momento.Responses.SortedSet.RemoveElement.Ok.t()} | {:error, Momento.Error.t()}
end
