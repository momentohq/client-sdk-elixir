defmodule CacheClient.HttpGetRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_HttpGetRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_key",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheKey",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "token",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "token",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  field :cache_name, 1, type: :string, json_name: "cacheName"
  field :cache_key, 2, type: :string, json_name: "cacheKey"
  field :token, 3, type: :string
end

defmodule CacheClient.HttpSetRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_HttpSetRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_key",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheKey",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "ttl_milliseconds",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT64,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "ttlMilliseconds",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "token",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "token",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_body",
          extendee: nil,
          number: 5,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".google.api.HttpBody",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheBody",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  field :cache_name, 1, type: :string, json_name: "cacheName"
  field :cache_key, 2, type: :string, json_name: "cacheKey"
  field :ttl_milliseconds, 3, type: :uint64, json_name: "ttlMilliseconds"
  field :token, 4, type: :string
  field :cache_body, 5, type: Google.Api.HttpBody, json_name: "cacheBody"
end

defmodule CacheClient.HttpCache.Service do
  @moduledoc false

  use GRPC.Service, name: "cache_client.HttpCache", protoc_gen_elixir_version: "0.12.0"

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.ServiceDescriptorProto{
      name: "HttpCache",
      method: [
        %Google.Protobuf.MethodDescriptorProto{
          name: "Get",
          input_type: ".cache_client._HttpGetRequest",
          output_type: ".google.api.HttpBody",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: [
              {72_295_728, 2,
               <<18, 35, 47, 99, 97, 99, 104, 101, 47, 103, 101, 116, 47, 123, 99, 97, 99, 104,
                 101, 95, 110, 97, 109, 101, 125, 47, 123, 99, 97, 99, 104, 101, 95, 107, 101,
                 121, 125>>}
            ]
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "Set",
          input_type: ".cache_client._HttpSetRequest",
          output_type: ".cache_client._SetResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: [
              {72_295_728, 2, "\"#/cache/set/{cache_name}/{cache_key}:\ncache_body"}
            ]
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SetButItsAPut",
          input_type: ".cache_client._HttpSetRequest",
          output_type: ".cache_client._SetResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: [
              {72_295_728, 2,
               <<26, 35, 47, 99, 97, 99, 104, 101, 47, 115, 101, 116, 47, 123, 99, 97, 99, 104,
                 101, 95, 110, 97, 109, 101, 125, 47, 123, 99, 97, 99, 104, 101, 95, 107, 101,
                 121, 125, 58, 10, 99, 97, 99, 104, 101, 95, 98, 111, 100, 121>>}
            ]
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        }
      ],
      options: nil,
      __unknown_fields__: []
    }
  end

  rpc :Get, CacheClient.HttpGetRequest, Google.Api.HttpBody

  rpc :Set, CacheClient.HttpSetRequest, CacheClient.SetResponse

  rpc :SetButItsAPut, CacheClient.HttpSetRequest, CacheClient.SetResponse
end

defmodule CacheClient.HttpCache.Stub do
  @moduledoc false

  use GRPC.Stub, service: CacheClient.HttpCache.Service
end