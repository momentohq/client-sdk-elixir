defmodule Momento.Responses.SortedSet.Fetch do
  defmodule Hit do
    @enforce_keys [:value]
    defstruct [:value]

    @type t() :: %__MODULE__{
            value: [{binary(), float()}]
          }
  end

  @type t() ::
          {:ok, Momento.Responses.SortedSet.Fetch.Hit.t()} | :miss | {:error, Momento.Error.t()}
end
