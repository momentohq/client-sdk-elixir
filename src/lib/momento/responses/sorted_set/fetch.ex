defmodule Momento.Responses.SortedSet.Fetch do
  defmodule Hit do
    @enforce_keys [:scored_values]
    defstruct [:scored_values]

    @type t() :: %__MODULE__{
            scored_values: [{binary(), float()}]
          }
  end

  @type t() ::
          {:ok, Momento.Responses.SortedSet.Fetch.Hit.t()} | :miss | {:error, Momento.Error.t()}
end
