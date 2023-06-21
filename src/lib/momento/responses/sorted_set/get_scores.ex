defmodule Momento.Responses.SortedSet.GetScores do
  defmodule Hit do
    @enforce_keys [:value]
    defstruct [:value]
    @type t() :: %__MODULE__{value: [{binary(), float() | nil}]}
  end

  @type t() ::
          {:ok, Momento.Responses.SortedSet.GetScores.Hit.t()}
          | :miss
          | {:error, Momento.Error.t()}
end
