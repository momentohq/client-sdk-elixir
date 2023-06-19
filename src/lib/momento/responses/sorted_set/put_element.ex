defmodule Momento.Responses.SortedSet.PutElement do
  defmodule Ok do
    @enforce_keys []
    defstruct []
    @type t() :: %__MODULE__{}
  end

  @type t() :: {:ok, Momento.Responses.SortedSet.PutElement.Ok.t()} | {:error, Momento.Error.t()}
end
