defmodule Momento.Responses.SortedSet.GetScores do
  defmodule Hit do
    @enforce_keys [:values]
    defstruct [:values]
    @type t() :: %__MODULE__{values: [{binary(), float() | nil}]}
  end

  @type t() ::
          {:ok, Momento.Responses.SortedSet.GetScores.Hit.t()}
          | :miss
          | {:error, Momento.Error.t()}
end
