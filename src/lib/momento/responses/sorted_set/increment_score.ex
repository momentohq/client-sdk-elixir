defmodule Momento.Responses.SortedSet.IncrementScore do
  defmodule Ok do
    @enforce_keys [:score]
    defstruct [:score]
    @type t() :: %__MODULE__{score: float()}
  end

  @type t() ::
          {:ok, Momento.Responses.SortedSet.IncrementScore.Ok.t()} | {:error, Momento.Error.t()}
end
