defmodule Momento.Responses.Delete do
  @type t() :: :success | {:error, Momento.Error.t()}
end
