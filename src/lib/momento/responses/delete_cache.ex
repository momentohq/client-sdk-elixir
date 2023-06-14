defmodule Momento.Responses.DeleteCache do
  defmodule Ok do
    @enforce_keys []
    defstruct []
    @type t() :: %__MODULE__{}
  end

  @type t() :: {:ok, Momento.Responses.DeleteCache.Ok.t()} | {:error, Momento.Error.t()}
end
