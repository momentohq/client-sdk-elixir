defmodule Momento.Protos.PbExtension do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.12.0"

  extend Google.Protobuf.MessageOptions, :retry_semantic, 50000,
    optional: true,
    type: Momento.Protos.RetrySemantic,
    json_name: "retrySemantic",
    enum: true
end