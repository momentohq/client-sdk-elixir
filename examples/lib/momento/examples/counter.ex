defmodule Momento.Examples.Counter do
  @enforce_keys [:atomic]
  defstruct [:atomic]

  @opaque t() :: %__MODULE__{
                   atomic: :atomics.atomics_ref()
                 }

  @spec new() :: t()
  def new() do
    %__MODULE__{
      atomic: :atomics.new(1, [])
    }
  end

  @spec increment(counter :: t()) :: integer()
  def increment(counter) do
    :atomics.add_get(counter.atomic, 1, 1)
  end

  @spec get(counter :: t()) :: integer()
  def get(counter) do
    :atomics.get(counter.atomic, 1)
  end
end
