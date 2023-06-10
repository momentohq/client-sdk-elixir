defmodule Momento.Responses.Get do
  @type t() :: {:hit, binary} | :miss | {:error, Momento.Error.t()}
end
