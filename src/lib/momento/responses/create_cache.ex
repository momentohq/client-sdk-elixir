defmodule Momento.Responses.CreateCache do
  defmodule Ok do
    @enforce_keys []
    defstruct []
    @type t() :: %__MODULE__{}
  end

  @type t() ::
          {:ok, Momento.Responses.CreateCache.Ok.t()}
          | :already_exists
          | {:error, Momento.Error.t()}
end
