defmodule Momento.Responses.ListCaches do
  defmodule Success do
    @enforce_keys [:caches]
    defstruct [:caches]

    @type t() :: %__MODULE__{
            caches: list(Momento.Responses.CacheInfo.t())
          }
  end

  @type t() :: {:success, Success.t()} | {:error, Momento.Error.t()}
end
