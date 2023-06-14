defmodule Momento.Responses.CreateCache do
  @type t() :: :success | :already_exists | {:error, Momento.Error.t()}
end
