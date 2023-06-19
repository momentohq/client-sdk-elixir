defmodule Momento.Requests.CollectionTtl do
  @enforce_keys [:ttl_seconds, :refresh_ttl]
  defstruct [:ttl_seconds, :refresh_ttl]

  @type t() :: %__MODULE__{
          ttl_seconds: float() | nil,
          refresh_ttl: boolean()
        }

  @spec of(ttl_seconds :: float()) :: t()
  def of(ttl_seconds) do
    %Momento.Requests.CollectionTtl{
      ttl_seconds: ttl_seconds,
      refresh_ttl: true
    }
  end
end
