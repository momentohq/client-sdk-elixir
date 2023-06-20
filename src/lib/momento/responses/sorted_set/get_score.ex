defmodule Momento.Responses.SortedSet.GetScore do
  defmodule Hit do
    @enforce_keys [:score]
    defstruct [:score]
    @type t() :: %__MODULE__{score: float()}
  end

  @type t() ::
          {:ok, Momento.Responses.SortedSet.GetScore.Hit.t()}
          | :miss
          | {:error, Momento.Error.t()}
end
