defmodule Momento.Responses.Get do
  @type t() :: :hit | :miss | {:error, Momento.Error.t}
end
