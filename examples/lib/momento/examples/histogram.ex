defmodule Momento.Examples.Histogram do
  use Agent

  @enforce_keys [:agent]
  defstruct [:agent]

  @opaque t() :: %__MODULE__{
                   agent: Agent.agent()
                 }

  @spec new() :: t()
  def new() do
    {:ok, histogram} = :hdr_histogram.open(60 * 1000, 3)
    {:ok, agent} = Agent.start_link(fn -> histogram end)

    %__MODULE__{
      agent: agent
    }
  end

  @spec record(histogram :: t(), value :: integer()) :: :void
  def record(histogram, value) do
    Agent.update(histogram.agent, fn h ->
      :hdr_histogram.record(h, value)
      h
    end)
    :void
  end

  @spec summary(histogram :: t()) :: String.t()
  def summary(histogram) do
    h = Agent.get(histogram.agent, fn h -> h end)

    """
      count: #{:hdr_histogram.get_total_count(h)}
        min: #{:hdr_histogram.min(h)}
        p50: #{:hdr_histogram.percentile(h, 50.0)}
        p90: #{:hdr_histogram.percentile(h, 90.0)}
        p95: #{:hdr_histogram.percentile(h, 95.0)}
        p96: #{:hdr_histogram.percentile(h, 96.0)}
        p97: #{:hdr_histogram.percentile(h, 97.0)}
        p98: #{:hdr_histogram.percentile(h, 98.0)}
        p99: #{:hdr_histogram.percentile(h, 99.0)}
      p99.9: #{:hdr_histogram.percentile(h, 99.9)}
        max: #{:hdr_histogram.max(h)}
    """
  end

  @spec stop(histogram :: t()) :: :void
  def stop(histogram) do
    Agent.stop(histogram.agent)
    :void
  end
end
