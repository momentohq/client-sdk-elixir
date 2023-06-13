defmodule Momento.Responses.DeleteCache do
  @type t() :: :success | {:error, Momento.Error.t()}
end
