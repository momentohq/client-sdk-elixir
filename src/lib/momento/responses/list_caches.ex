defmodule Momento.Responses.ListCaches do
  defmodule Ok do
    @enforce_keys [:caches]
    defstruct [:caches]

    @type t() :: %__MODULE__{
            caches: list(Momento.Responses.CacheInfo.t())
          }
  end

  @type t() :: {:ok, Ok.t()} | {:error, Momento.Error.t()}
end
