defmodule Momento.Responses.SortedSet.GetRank do
  defmodule Hit do
    @enforce_keys [:rank]
    defstruct [:rank]
    @type t() :: %__MODULE__{rank: integer()}
  end

  @type t() ::
          {:ok, Momento.Responses.SortedSet.GetRank.Hit.t()} | :miss | {:error, Momento.Error.t()}
end
