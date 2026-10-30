defmodule Momento.Responses.CacheInfo do
  @enforce_keys [:name]
  defstruct [:name, id: ""]

  @type t() :: %__MODULE__{
          name: String.t(),
          id: String.t()
        }
end
