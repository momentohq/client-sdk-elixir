defmodule Momento.Responses.Set do
  @type t() :: :success | {:error, Momento.Error.t()}
end
