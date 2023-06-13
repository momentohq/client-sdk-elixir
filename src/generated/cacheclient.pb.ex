defmodule Momento.Protos.CacheClient.ECacheResult do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.EnumDescriptorProto{
      name: "ECacheResult",
      value: [
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "Invalid",
          number: 0,
          options: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "Ok",
          number: 1,
          options: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "Hit",
          number: 2,
          options: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "Miss",
          number: 3,
          options: nil,
          __unknown_fields__: []
        }
      ],
      options: nil,
      reserved_range: [
        %Google.Protobuf.EnumDescriptorProto.EnumReservedRange{
          start: 4,
          end: 6,
          __unknown_fields__: []
        }
      ],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  field :Invalid, 0
  field :Ok, 1
  field :Hit, 2
  field :Miss, 3
end

defmodule Momento.Protos.CacheClient.ItemGetTypeResponse.ItemType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.EnumDescriptorProto{
      name: "ItemType",
      value: [
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "SCALAR",
          number: 0,
          options: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "DICTIONARY",
          number: 1,
          options: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "SET",
          number: 2,
          options: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "LIST",
          number: 3,
          options: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "SORTED_SET",
          number: 4,
          options: nil,
          __unknown_fields__: []
        }
      ],
      options: nil,
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  field :SCALAR, 0
  field :DICTIONARY, 1
  field :SET, 2
  field :LIST, 3
  field :SORTED_SET, 4
end

defmodule Momento.Protos.CacheClient.SortedSetFetchRequest.Order do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.EnumDescriptorProto{
      name: "Order",
      value: [
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "ASCENDING",
          number: 0,
          options: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "DESCENDING",
          number: 1,
          options: nil,
          __unknown_fields__: []
        }
      ],
      options: nil,
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  field :ASCENDING, 0
  field :DESCENDING, 1
end

defmodule Momento.Protos.CacheClient.SortedSetGetRankRequest.Order do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.EnumDescriptorProto{
      name: "Order",
      value: [
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "ASCENDING",
          number: 0,
          options: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "DESCENDING",
          number: 1,
          options: nil,
          __unknown_fields__: []
        }
      ],
      options: nil,
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  field :ASCENDING, 0
  field :DESCENDING, 1
end

defmodule Momento.Protos.CacheClient.GetRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_GetRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_key",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheKey",
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

  field :cache_key, 1, type: :bytes, json_name: "cacheKey"
end

defmodule Momento.Protos.CacheClient.GetResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_GetResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "result",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_ENUM,
          type_name: ".cache_client.ECacheResult",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "result",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_body",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheBody",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "message",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "message",
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

  field :result, 1, type: Momento.Protos.CacheClient.ECacheResult, enum: true
  field :cache_body, 2, type: :bytes, json_name: "cacheBody"
  field :message, 3, type: :string
end

defmodule Momento.Protos.CacheClient.DeleteRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DeleteRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_key",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheKey",
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

  field :cache_key, 1, type: :bytes, json_name: "cacheKey"
end

defmodule Momento.Protos.CacheClient.DeleteResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DeleteResponse",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SetRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SetRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_key",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheKey",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_body",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheBody",
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

  field :cache_key, 1, type: :bytes, json_name: "cacheKey"
  field :cache_body, 2, type: :bytes, json_name: "cacheBody"
  field :ttl_milliseconds, 3, type: :uint64, json_name: "ttlMilliseconds"
end

defmodule Momento.Protos.CacheClient.SetResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SetResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "result",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_ENUM,
          type_name: ".cache_client.ECacheResult",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "result",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "message",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "message",
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

  field :result, 1, type: Momento.Protos.CacheClient.ECacheResult, enum: true
  field :message, 2, type: :string
end

defmodule Momento.Protos.CacheClient.SetIfNotExistsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SetIfNotExistsRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_key",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheKey",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_body",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheBody",
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

  field :cache_key, 1, type: :bytes, json_name: "cacheKey"
  field :cache_body, 2, type: :bytes, json_name: "cacheBody"
  field :ttl_milliseconds, 3, type: :uint64, json_name: "ttlMilliseconds"
end

defmodule Momento.Protos.CacheClient.SetIfNotExistsResponse.Stored do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Stored",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SetIfNotExistsResponse.NotStored do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_NotStored",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SetIfNotExistsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SetIfNotExistsResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "stored",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SetIfNotExistsResponse._Stored",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "stored",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "not_stored",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SetIfNotExistsResponse._NotStored",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "notStored",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Stored",
          field: [],
          nested_type: [],
          enum_type: [],
          extension_range: [],
          extension: [],
          options: nil,
          oneof_decl: [],
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        },
        %Google.Protobuf.DescriptorProto{
          name: "_NotStored",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "result",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :result, 0

  field :stored, 1, type: Momento.Protos.CacheClient.SetIfNotExistsResponse.Stored, oneof: 0

  field :not_stored, 2,
    type: Momento.Protos.CacheClient.SetIfNotExistsResponse.NotStored,
    json_name: "notStored",
    oneof: 0
end

defmodule Momento.Protos.CacheClient.KeysExistRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_KeysExistRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_keys",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheKeys",
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

  field :cache_keys, 1, repeated: true, type: :bytes, json_name: "cacheKeys"
end

defmodule Momento.Protos.CacheClient.KeysExistResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_KeysExistResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "exists",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_BOOL,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "exists",
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

  field :exists, 1, repeated: true, type: :bool
end

defmodule Momento.Protos.CacheClient.IncrementRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_IncrementRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_key",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheKey",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "amount",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_INT64,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "amount",
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

  field :cache_key, 1, type: :bytes, json_name: "cacheKey"
  field :amount, 2, type: :int64
  field :ttl_milliseconds, 3, type: :uint64, json_name: "ttlMilliseconds"
end

defmodule Momento.Protos.CacheClient.IncrementResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_IncrementResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "value",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_INT64,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "value",
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

  field :value, 1, type: :int64
end

defmodule Momento.Protos.CacheClient.UpdateTtlRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_UpdateTtlRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_key",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheKey",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "increase_to_milliseconds",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT64,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "increaseToMilliseconds",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "decrease_to_milliseconds",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT64,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "decreaseToMilliseconds",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "overwrite_to_milliseconds",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT64,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "overwriteToMilliseconds",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "update_ttl",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :update_ttl, 0

  field :cache_key, 1, type: :bytes, json_name: "cacheKey"
  field :increase_to_milliseconds, 2, type: :uint64, json_name: "increaseToMilliseconds", oneof: 0
  field :decrease_to_milliseconds, 3, type: :uint64, json_name: "decreaseToMilliseconds", oneof: 0

  field :overwrite_to_milliseconds, 4,
    type: :uint64,
    json_name: "overwriteToMilliseconds",
    oneof: 0
end

defmodule Momento.Protos.CacheClient.UpdateTtlResponse.Set do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Set",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.UpdateTtlResponse.NotSet do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_NotSet",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.UpdateTtlResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.UpdateTtlResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_UpdateTtlResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._UpdateTtlResponse._Set",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "set",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "not_set",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._UpdateTtlResponse._NotSet",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "notSet",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._UpdateTtlResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Set",
          field: [],
          nested_type: [],
          enum_type: [],
          extension_range: [],
          extension: [],
          options: nil,
          oneof_decl: [],
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        },
        %Google.Protobuf.DescriptorProto{
          name: "_NotSet",
          field: [],
          nested_type: [],
          enum_type: [],
          extension_range: [],
          extension: [],
          options: nil,
          oneof_decl: [],
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "result",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :result, 0

  field :set, 1, type: Momento.Protos.CacheClient.UpdateTtlResponse.Set, oneof: 0

  field :not_set, 2,
    type: Momento.Protos.CacheClient.UpdateTtlResponse.NotSet,
    json_name: "notSet",
    oneof: 0

  field :missing, 3, type: Momento.Protos.CacheClient.UpdateTtlResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.ItemGetTtlRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ItemGetTtlRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_key",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheKey",
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

  field :cache_key, 1, type: :bytes, json_name: "cacheKey"
end

defmodule Momento.Protos.CacheClient.ItemGetTtlResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "remaining_ttl_millis",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT64,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "remainingTtlMillis",
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

  field :remaining_ttl_millis, 1, type: :uint64, json_name: "remainingTtlMillis"
end

defmodule Momento.Protos.CacheClient.ItemGetTtlResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.ItemGetTtlResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ItemGetTtlResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ItemGetTtlResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ItemGetTtlResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "remaining_ttl_millis",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT64,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "remainingTtlMillis",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "result",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :result, 0

  field :found, 1, type: Momento.Protos.CacheClient.ItemGetTtlResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.ItemGetTtlResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.ItemGetTypeRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ItemGetTypeRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_key",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "cacheKey",
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

  field :cache_key, 1, type: :bytes, json_name: "cacheKey"
end

defmodule Momento.Protos.CacheClient.ItemGetTypeResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "item_type",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_ENUM,
          type_name: ".cache_client._ItemGetTypeResponse.ItemType",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "itemType",
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

  field :item_type, 1,
    type: Momento.Protos.CacheClient.ItemGetTypeResponse.ItemType,
    json_name: "itemType",
    enum: true
end

defmodule Momento.Protos.CacheClient.ItemGetTypeResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.ItemGetTypeResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ItemGetTypeResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ItemGetTypeResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ItemGetTypeResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "item_type",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_ENUM,
              type_name: ".cache_client._ItemGetTypeResponse.ItemType",
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "itemType",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [
        %Google.Protobuf.EnumDescriptorProto{
          name: "ItemType",
          value: [
            %Google.Protobuf.EnumValueDescriptorProto{
              name: "SCALAR",
              number: 0,
              options: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.EnumValueDescriptorProto{
              name: "DICTIONARY",
              number: 1,
              options: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.EnumValueDescriptorProto{
              name: "SET",
              number: 2,
              options: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.EnumValueDescriptorProto{
              name: "LIST",
              number: 3,
              options: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.EnumValueDescriptorProto{
              name: "SORTED_SET",
              number: 4,
              options: nil,
              __unknown_fields__: []
            }
          ],
          options: nil,
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        }
      ],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "result",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :result, 0

  field :found, 1, type: Momento.Protos.CacheClient.ItemGetTypeResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.ItemGetTypeResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.DictionaryGetRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DictionaryGetRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "dictionary_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "dictionaryName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "fields",
          extendee: nil,
          number: 2,
          label: :LABEL_REPEATED,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "fields",
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

  field :dictionary_name, 1, type: :bytes, json_name: "dictionaryName"
  field :fields, 2, repeated: true, type: :bytes
end

defmodule Momento.Protos.CacheClient.DictionaryGetResponse.DictionaryGetResponsePart do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DictionaryGetResponsePart",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "result",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_ENUM,
          type_name: ".cache_client.ECacheResult",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "result",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_body",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
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

  field :result, 1, type: Momento.Protos.CacheClient.ECacheResult, enum: true
  field :cache_body, 2, type: :bytes, json_name: "cacheBody"
end

defmodule Momento.Protos.CacheClient.DictionaryGetResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "items",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._DictionaryGetResponse._DictionaryGetResponsePart",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "items",
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

  field :items, 1,
    repeated: true,
    type: Momento.Protos.CacheClient.DictionaryGetResponse.DictionaryGetResponsePart
end

defmodule Momento.Protos.CacheClient.DictionaryGetResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.DictionaryGetResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DictionaryGetResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._DictionaryGetResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._DictionaryGetResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_DictionaryGetResponsePart",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "result",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_ENUM,
              type_name: ".cache_client.ECacheResult",
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "result",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "cache_body",
              extendee: nil,
              number: 2,
              label: :LABEL_OPTIONAL,
              type: :TYPE_BYTES,
              type_name: nil,
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "items",
              extendee: nil,
              number: 1,
              label: :LABEL_REPEATED,
              type: :TYPE_MESSAGE,
              type_name: ".cache_client._DictionaryGetResponse._DictionaryGetResponsePart",
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "items",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "dictionary",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :dictionary, 0

  field :found, 1, type: Momento.Protos.CacheClient.DictionaryGetResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.DictionaryGetResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.DictionaryFetchRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DictionaryFetchRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "dictionary_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "dictionaryName",
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

  field :dictionary_name, 1, type: :bytes, json_name: "dictionaryName"
end

defmodule Momento.Protos.CacheClient.DictionaryFieldValuePair do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DictionaryFieldValuePair",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "field",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "field",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "value",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "value",
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

  field :field, 1, type: :bytes
  field :value, 2, type: :bytes
end

defmodule Momento.Protos.CacheClient.DictionaryFetchResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "items",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._DictionaryFieldValuePair",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "items",
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

  field :items, 1, repeated: true, type: Momento.Protos.CacheClient.DictionaryFieldValuePair
end

defmodule Momento.Protos.CacheClient.DictionaryFetchResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.DictionaryFetchResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DictionaryFetchResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._DictionaryFetchResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._DictionaryFetchResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "items",
              extendee: nil,
              number: 1,
              label: :LABEL_REPEATED,
              type: :TYPE_MESSAGE,
              type_name: ".cache_client._DictionaryFieldValuePair",
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "items",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "dictionary",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :dictionary, 0

  field :found, 1, type: Momento.Protos.CacheClient.DictionaryFetchResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.DictionaryFetchResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.DictionarySetRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DictionarySetRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "dictionary_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "dictionaryName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "items",
          extendee: nil,
          number: 2,
          label: :LABEL_REPEATED,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._DictionaryFieldValuePair",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "items",
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
          name: "refresh_ttl",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BOOL,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "refreshTtl",
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

  field :dictionary_name, 1, type: :bytes, json_name: "dictionaryName"
  field :items, 2, repeated: true, type: Momento.Protos.CacheClient.DictionaryFieldValuePair
  field :ttl_milliseconds, 3, type: :uint64, json_name: "ttlMilliseconds"
  field :refresh_ttl, 4, type: :bool, json_name: "refreshTtl"
end

defmodule Momento.Protos.CacheClient.DictionarySetResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DictionarySetResponse",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.DictionaryIncrementRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DictionaryIncrementRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "dictionary_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "dictionaryName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "field",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "field",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "amount",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_INT64,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "amount",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "ttl_milliseconds",
          extendee: nil,
          number: 4,
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
          name: "refresh_ttl",
          extendee: nil,
          number: 5,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BOOL,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "refreshTtl",
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

  field :dictionary_name, 1, type: :bytes, json_name: "dictionaryName"
  field :field, 2, type: :bytes
  field :amount, 3, type: :int64
  field :ttl_milliseconds, 4, type: :uint64, json_name: "ttlMilliseconds"
  field :refresh_ttl, 5, type: :bool, json_name: "refreshTtl"
end

defmodule Momento.Protos.CacheClient.DictionaryIncrementResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DictionaryIncrementResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "value",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_INT64,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "value",
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

  field :value, 1, type: :int64
end

defmodule Momento.Protos.CacheClient.DictionaryDeleteRequest.Some do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "Some",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "fields",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "fields",
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

  field :fields, 1, repeated: true, type: :bytes
end

defmodule Momento.Protos.CacheClient.DictionaryDeleteRequest.All do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "All",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.DictionaryDeleteRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DictionaryDeleteRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "dictionary_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "dictionaryName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "some",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._DictionaryDeleteRequest.Some",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "some",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "all",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._DictionaryDeleteRequest.All",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "all",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "Some",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "fields",
              extendee: nil,
              number: 1,
              label: :LABEL_REPEATED,
              type: :TYPE_BYTES,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "fields",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "All",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "delete",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :delete, 0

  field :dictionary_name, 1, type: :bytes, json_name: "dictionaryName"
  field :some, 2, type: Momento.Protos.CacheClient.DictionaryDeleteRequest.Some, oneof: 0
  field :all, 3, type: Momento.Protos.CacheClient.DictionaryDeleteRequest.All, oneof: 0
end

defmodule Momento.Protos.CacheClient.DictionaryDeleteResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DictionaryDeleteResponse",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.DictionaryLengthRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DictionaryLengthRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "dictionary_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "dictionaryName",
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

  field :dictionary_name, 1, type: :bytes, json_name: "dictionaryName"
end

defmodule Momento.Protos.CacheClient.DictionaryLengthResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "length",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "length",
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

  field :length, 1, type: :uint32
end

defmodule Momento.Protos.CacheClient.DictionaryLengthResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.DictionaryLengthResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_DictionaryLengthResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._DictionaryLengthResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._DictionaryLengthResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "length",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "length",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "dictionary",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :dictionary, 0

  field :found, 1, type: Momento.Protos.CacheClient.DictionaryLengthResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.DictionaryLengthResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.SetFetchRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SetFetchRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "setName",
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

  field :set_name, 1, type: :bytes, json_name: "setName"
end

defmodule Momento.Protos.CacheClient.SetFetchResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "elements",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "elements",
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

  field :elements, 1, repeated: true, type: :bytes
end

defmodule Momento.Protos.CacheClient.SetFetchResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SetFetchResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SetFetchResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SetFetchResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SetFetchResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "elements",
              extendee: nil,
              number: 1,
              label: :LABEL_REPEATED,
              type: :TYPE_BYTES,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "elements",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "set", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :set, 0

  field :found, 1, type: Momento.Protos.CacheClient.SetFetchResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.SetFetchResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.SetUnionRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SetUnionRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "setName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "elements",
          extendee: nil,
          number: 2,
          label: :LABEL_REPEATED,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "elements",
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
          name: "refresh_ttl",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BOOL,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "refreshTtl",
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

  field :set_name, 1, type: :bytes, json_name: "setName"
  field :elements, 2, repeated: true, type: :bytes
  field :ttl_milliseconds, 3, type: :uint64, json_name: "ttlMilliseconds"
  field :refresh_ttl, 4, type: :bool, json_name: "refreshTtl"
end

defmodule Momento.Protos.CacheClient.SetUnionResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SetUnionResponse",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SetDifferenceRequest.Minuend do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Minuend",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "elements",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "elements",
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

  field :elements, 1, repeated: true, type: :bytes
end

defmodule Momento.Protos.CacheClient.SetDifferenceRequest.Subtrahend.Set do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Set",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "elements",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "elements",
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

  field :elements, 1, repeated: true, type: :bytes
end

defmodule Momento.Protos.CacheClient.SetDifferenceRequest.Subtrahend.Identity do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Identity",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SetDifferenceRequest.Subtrahend do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Subtrahend",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SetDifferenceRequest._Subtrahend._Set",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "set",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "identity",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SetDifferenceRequest._Subtrahend._Identity",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "identity",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Set",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "elements",
              extendee: nil,
              number: 1,
              label: :LABEL_REPEATED,
              type: :TYPE_BYTES,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "elements",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Identity",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "subtrahend_set",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :subtrahend_set, 0

  field :set, 1, type: Momento.Protos.CacheClient.SetDifferenceRequest.Subtrahend.Set, oneof: 0

  field :identity, 2,
    type: Momento.Protos.CacheClient.SetDifferenceRequest.Subtrahend.Identity,
    oneof: 0
end

defmodule Momento.Protos.CacheClient.SetDifferenceRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SetDifferenceRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "setName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "minuend",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SetDifferenceRequest._Minuend",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "minuend",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "subtrahend",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SetDifferenceRequest._Subtrahend",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "subtrahend",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Minuend",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "elements",
              extendee: nil,
              number: 1,
              label: :LABEL_REPEATED,
              type: :TYPE_BYTES,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "elements",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Subtrahend",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "set",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_MESSAGE,
              type_name: ".cache_client._SetDifferenceRequest._Subtrahend._Set",
              default_value: nil,
              options: nil,
              oneof_index: 0,
              json_name: "set",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "identity",
              extendee: nil,
              number: 2,
              label: :LABEL_OPTIONAL,
              type: :TYPE_MESSAGE,
              type_name: ".cache_client._SetDifferenceRequest._Subtrahend._Identity",
              default_value: nil,
              options: nil,
              oneof_index: 0,
              json_name: "identity",
              proto3_optional: nil,
              __unknown_fields__: []
            }
          ],
          nested_type: [
            %Google.Protobuf.DescriptorProto{
              name: "_Set",
              field: [
                %Google.Protobuf.FieldDescriptorProto{
                  name: "elements",
                  extendee: nil,
                  number: 1,
                  label: :LABEL_REPEATED,
                  type: :TYPE_BYTES,
                  type_name: nil,
                  default_value: nil,
                  options: nil,
                  oneof_index: nil,
                  json_name: "elements",
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
            },
            %Google.Protobuf.DescriptorProto{
              name: "_Identity",
              field: [],
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
          ],
          enum_type: [],
          extension_range: [],
          extension: [],
          options: nil,
          oneof_decl: [
            %Google.Protobuf.OneofDescriptorProto{
              name: "subtrahend_set",
              options: nil,
              __unknown_fields__: []
            }
          ],
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        }
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "difference",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :difference, 0

  field :set_name, 1, type: :bytes, json_name: "setName"
  field :minuend, 2, type: Momento.Protos.CacheClient.SetDifferenceRequest.Minuend, oneof: 0
  field :subtrahend, 3, type: Momento.Protos.CacheClient.SetDifferenceRequest.Subtrahend, oneof: 0
end

defmodule Momento.Protos.CacheClient.SetDifferenceResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SetDifferenceResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SetDifferenceResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SetDifferenceResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SetDifferenceResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SetDifferenceResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [],
          nested_type: [],
          enum_type: [],
          extension_range: [],
          extension: [],
          options: nil,
          oneof_decl: [],
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "set", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :set, 0

  field :found, 1, type: Momento.Protos.CacheClient.SetDifferenceResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.SetDifferenceResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.SetContainsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SetContainsRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "setName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "elements",
          extendee: nil,
          number: 2,
          label: :LABEL_REPEATED,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "elements",
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

  field :set_name, 1, type: :bytes, json_name: "setName"
  field :elements, 2, repeated: true, type: :bytes
end

defmodule Momento.Protos.CacheClient.SetContainsResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "contains",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_BOOL,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "contains",
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

  field :contains, 1, repeated: true, type: :bool
end

defmodule Momento.Protos.CacheClient.SetContainsResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SetContainsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SetContainsResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SetContainsResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SetContainsResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "contains",
              extendee: nil,
              number: 1,
              label: :LABEL_REPEATED,
              type: :TYPE_BOOL,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "contains",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "set", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :set, 0

  field :found, 1, type: Momento.Protos.CacheClient.SetContainsResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.SetContainsResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.SetLengthRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SetLengthRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "setName",
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

  field :set_name, 1, type: :bytes, json_name: "setName"
end

defmodule Momento.Protos.CacheClient.SetLengthResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "length",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "length",
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

  field :length, 1, type: :uint32
end

defmodule Momento.Protos.CacheClient.SetLengthResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SetLengthResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SetLengthResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SetLengthResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SetLengthResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "length",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "length",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "set", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :set, 0

  field :found, 1, type: Momento.Protos.CacheClient.SetLengthResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.SetLengthResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.ListConcatenateFrontRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListConcatenateFrontRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "values",
          extendee: nil,
          number: 2,
          label: :LABEL_REPEATED,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "values",
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
          name: "refresh_ttl",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BOOL,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "refreshTtl",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "truncate_back_to_size",
          extendee: nil,
          number: 5,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "truncateBackToSize",
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

  field :list_name, 1, type: :bytes, json_name: "listName"
  field :values, 2, repeated: true, type: :bytes
  field :ttl_milliseconds, 3, type: :uint64, json_name: "ttlMilliseconds"
  field :refresh_ttl, 4, type: :bool, json_name: "refreshTtl"
  field :truncate_back_to_size, 5, type: :uint32, json_name: "truncateBackToSize"
end

defmodule Momento.Protos.CacheClient.ListConcatenateFrontResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListConcatenateFrontResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_length",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listLength",
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

  field :list_length, 1, type: :uint32, json_name: "listLength"
end

defmodule Momento.Protos.CacheClient.ListConcatenateBackRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListConcatenateBackRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "values",
          extendee: nil,
          number: 2,
          label: :LABEL_REPEATED,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "values",
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
          name: "refresh_ttl",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BOOL,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "refreshTtl",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "truncate_front_to_size",
          extendee: nil,
          number: 5,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "truncateFrontToSize",
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

  field :list_name, 1, type: :bytes, json_name: "listName"
  field :values, 2, repeated: true, type: :bytes
  field :ttl_milliseconds, 3, type: :uint64, json_name: "ttlMilliseconds"
  field :refresh_ttl, 4, type: :bool, json_name: "refreshTtl"
  field :truncate_front_to_size, 5, type: :uint32, json_name: "truncateFrontToSize"
end

defmodule Momento.Protos.CacheClient.ListConcatenateBackResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListConcatenateBackResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_length",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listLength",
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

  field :list_length, 1, type: :uint32, json_name: "listLength"
end

defmodule Momento.Protos.CacheClient.ListPushFrontRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListPushFrontRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "value",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "value",
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
          name: "refresh_ttl",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BOOL,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "refreshTtl",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "truncate_back_to_size",
          extendee: nil,
          number: 5,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "truncateBackToSize",
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

  field :list_name, 1, type: :bytes, json_name: "listName"
  field :value, 2, type: :bytes
  field :ttl_milliseconds, 3, type: :uint64, json_name: "ttlMilliseconds"
  field :refresh_ttl, 4, type: :bool, json_name: "refreshTtl"
  field :truncate_back_to_size, 5, type: :uint32, json_name: "truncateBackToSize"
end

defmodule Momento.Protos.CacheClient.ListPushFrontResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListPushFrontResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_length",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listLength",
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

  field :list_length, 1, type: :uint32, json_name: "listLength"
end

defmodule Momento.Protos.CacheClient.ListPushBackRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListPushBackRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "value",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "value",
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
          name: "refresh_ttl",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BOOL,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "refreshTtl",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "truncate_front_to_size",
          extendee: nil,
          number: 5,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "truncateFrontToSize",
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

  field :list_name, 1, type: :bytes, json_name: "listName"
  field :value, 2, type: :bytes
  field :ttl_milliseconds, 3, type: :uint64, json_name: "ttlMilliseconds"
  field :refresh_ttl, 4, type: :bool, json_name: "refreshTtl"
  field :truncate_front_to_size, 5, type: :uint32, json_name: "truncateFrontToSize"
end

defmodule Momento.Protos.CacheClient.ListPushBackResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListPushBackResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_length",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listLength",
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

  field :list_length, 1, type: :uint32, json_name: "listLength"
end

defmodule Momento.Protos.CacheClient.ListPopFrontRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListPopFrontRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listName",
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

  field :list_name, 1, type: :bytes, json_name: "listName"
end

defmodule Momento.Protos.CacheClient.ListPopFrontResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "front",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "front",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_length",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listLength",
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

  field :front, 1, type: :bytes
  field :list_length, 2, type: :uint32, json_name: "listLength"
end

defmodule Momento.Protos.CacheClient.ListPopFrontResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.ListPopFrontResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListPopFrontResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListPopFrontResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListPopFrontResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "front",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_BYTES,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "front",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "list_length",
              extendee: nil,
              number: 2,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "listLength",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "list", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :list, 0

  field :found, 1, type: Momento.Protos.CacheClient.ListPopFrontResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.ListPopFrontResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.ListPopBackRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListPopBackRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listName",
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

  field :list_name, 1, type: :bytes, json_name: "listName"
end

defmodule Momento.Protos.CacheClient.ListPopBackResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "back",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "back",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_length",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listLength",
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

  field :back, 1, type: :bytes
  field :list_length, 2, type: :uint32, json_name: "listLength"
end

defmodule Momento.Protos.CacheClient.ListPopBackResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.ListPopBackResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListPopBackResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListPopBackResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListPopBackResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "back",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_BYTES,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "back",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "list_length",
              extendee: nil,
              number: 2,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "listLength",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "list", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :list, 0

  field :found, 1, type: Momento.Protos.CacheClient.ListPopBackResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.ListPopBackResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.ListRange do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListRange",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "begin_index",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "beginIndex",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "count",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "count",
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

  field :begin_index, 1, type: :uint32, json_name: "beginIndex"
  field :count, 2, type: :uint32
end

defmodule Momento.Protos.CacheClient.ListEraseRequest.All do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_All",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.ListEraseRequest.ListRanges do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListRanges",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "ranges",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListRange",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "ranges",
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

  field :ranges, 1, repeated: true, type: Momento.Protos.CacheClient.ListRange
end

defmodule Momento.Protos.CacheClient.ListEraseRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListEraseRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "some",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListEraseRequest._ListRanges",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "some",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "all",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListEraseRequest._All",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "all",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_All",
          field: [],
          nested_type: [],
          enum_type: [],
          extension_range: [],
          extension: [],
          options: nil,
          oneof_decl: [],
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        },
        %Google.Protobuf.DescriptorProto{
          name: "_ListRanges",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "ranges",
              extendee: nil,
              number: 1,
              label: :LABEL_REPEATED,
              type: :TYPE_MESSAGE,
              type_name: ".cache_client._ListRange",
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "ranges",
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "erase", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :erase, 0

  field :list_name, 1, type: :bytes, json_name: "listName"
  field :some, 2, type: Momento.Protos.CacheClient.ListEraseRequest.ListRanges, oneof: 0
  field :all, 3, type: Momento.Protos.CacheClient.ListEraseRequest.All, oneof: 0
end

defmodule Momento.Protos.CacheClient.ListEraseResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_length",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listLength",
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

  field :list_length, 1, type: :uint32, json_name: "listLength"
end

defmodule Momento.Protos.CacheClient.ListEraseResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.ListEraseResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListEraseResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListEraseResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListEraseResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "list_length",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "listLength",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "list", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :list, 0

  field :found, 1, type: Momento.Protos.CacheClient.ListEraseResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.ListEraseResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.ListRemoveRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListRemoveRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "all_elements_with_value",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "allElementsWithValue",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "remove",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :remove, 0

  field :list_name, 1, type: :bytes, json_name: "listName"
  field :all_elements_with_value, 2, type: :bytes, json_name: "allElementsWithValue", oneof: 0
end

defmodule Momento.Protos.CacheClient.ListRemoveResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_length",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listLength",
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

  field :list_length, 1, type: :uint32, json_name: "listLength"
end

defmodule Momento.Protos.CacheClient.ListRemoveResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.ListRemoveResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListRemoveResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListRemoveResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListRemoveResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "list_length",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "listLength",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "list", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :list, 0

  field :found, 1, type: Momento.Protos.CacheClient.ListRemoveResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.ListRemoveResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.Unbounded do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Unbounded",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.ListFetchRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListFetchRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "unbounded_start",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._Unbounded",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "unboundedStart",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "inclusive_start",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_SINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "inclusiveStart",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "unbounded_end",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._Unbounded",
          default_value: nil,
          options: nil,
          oneof_index: 1,
          json_name: "unboundedEnd",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "exclusive_end",
          extendee: nil,
          number: 5,
          label: :LABEL_OPTIONAL,
          type: :TYPE_SINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: 1,
          json_name: "exclusiveEnd",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "start_index",
          options: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.OneofDescriptorProto{
          name: "end_index",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :start_index, 0

  oneof :end_index, 1

  field :list_name, 1, type: :bytes, json_name: "listName"

  field :unbounded_start, 2,
    type: Momento.Protos.CacheClient.Unbounded,
    json_name: "unboundedStart",
    oneof: 0

  field :inclusive_start, 3, type: :sint32, json_name: "inclusiveStart", oneof: 0

  field :unbounded_end, 4,
    type: Momento.Protos.CacheClient.Unbounded,
    json_name: "unboundedEnd",
    oneof: 1

  field :exclusive_end, 5, type: :sint32, json_name: "exclusiveEnd", oneof: 1
end

defmodule Momento.Protos.CacheClient.ListRetainRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListRetainRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "unbounded_start",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._Unbounded",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "unboundedStart",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "inclusive_start",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_SINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "inclusiveStart",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "unbounded_end",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._Unbounded",
          default_value: nil,
          options: nil,
          oneof_index: 1,
          json_name: "unboundedEnd",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "exclusive_end",
          extendee: nil,
          number: 5,
          label: :LABEL_OPTIONAL,
          type: :TYPE_SINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: 1,
          json_name: "exclusiveEnd",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "ttl_milliseconds",
          extendee: nil,
          number: 6,
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
          name: "refresh_ttl",
          extendee: nil,
          number: 7,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BOOL,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "refreshTtl",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "start_index",
          options: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.OneofDescriptorProto{
          name: "end_index",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :start_index, 0

  oneof :end_index, 1

  field :list_name, 1, type: :bytes, json_name: "listName"

  field :unbounded_start, 2,
    type: Momento.Protos.CacheClient.Unbounded,
    json_name: "unboundedStart",
    oneof: 0

  field :inclusive_start, 3, type: :sint32, json_name: "inclusiveStart", oneof: 0

  field :unbounded_end, 4,
    type: Momento.Protos.CacheClient.Unbounded,
    json_name: "unboundedEnd",
    oneof: 1

  field :exclusive_end, 5, type: :sint32, json_name: "exclusiveEnd", oneof: 1
  field :ttl_milliseconds, 6, type: :uint64, json_name: "ttlMilliseconds"
  field :refresh_ttl, 7, type: :bool, json_name: "refreshTtl"
end

defmodule Momento.Protos.CacheClient.ListRetainResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_length",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listLength",
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

  field :list_length, 1, type: :uint32, json_name: "listLength"
end

defmodule Momento.Protos.CacheClient.ListRetainResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.ListRetainResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListRetainResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListRetainResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListRetainResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "list_length",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "listLength",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "list", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :list, 0

  field :found, 1, type: Momento.Protos.CacheClient.ListRetainResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.ListRetainResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.ListFetchResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "values",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "values",
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

  field :values, 1, repeated: true, type: :bytes
end

defmodule Momento.Protos.CacheClient.ListFetchResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.ListFetchResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListFetchResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListFetchResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListFetchResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "values",
              extendee: nil,
              number: 1,
              label: :LABEL_REPEATED,
              type: :TYPE_BYTES,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "values",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "list", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :list, 0

  field :found, 1, type: Momento.Protos.CacheClient.ListFetchResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.ListFetchResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.ListLengthRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListLengthRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "list_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "listName",
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

  field :list_name, 1, type: :bytes, json_name: "listName"
end

defmodule Momento.Protos.CacheClient.ListLengthResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "length",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "length",
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

  field :length, 1, type: :uint32
end

defmodule Momento.Protos.CacheClient.ListLengthResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.ListLengthResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ListLengthResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListLengthResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._ListLengthResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "length",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "length",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "list", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :list, 0

  field :found, 1, type: Momento.Protos.CacheClient.ListLengthResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.ListLengthResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.SortedSetElement do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetElement",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "value",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "value",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "score",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_DOUBLE,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "score",
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

  field :value, 1, type: :bytes
  field :score, 2, type: :double
end

defmodule Momento.Protos.CacheClient.SortedSetPutRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetPutRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "setName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "elements",
          extendee: nil,
          number: 2,
          label: :LABEL_REPEATED,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetElement",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "elements",
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
          name: "refresh_ttl",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BOOL,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "refreshTtl",
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

  field :set_name, 1, type: :bytes, json_name: "setName"
  field :elements, 2, repeated: true, type: Momento.Protos.CacheClient.SortedSetElement
  field :ttl_milliseconds, 3, type: :uint64, json_name: "ttlMilliseconds"
  field :refresh_ttl, 4, type: :bool, json_name: "refreshTtl"
end

defmodule Momento.Protos.CacheClient.SortedSetPutResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetPutResponse",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SortedSetFetchRequest.ByIndex do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ByIndex",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "unbounded_start",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._Unbounded",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "unboundedStart",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "inclusive_start_index",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_SINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "inclusiveStartIndex",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "unbounded_end",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._Unbounded",
          default_value: nil,
          options: nil,
          oneof_index: 1,
          json_name: "unboundedEnd",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "exclusive_end_index",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_SINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: 1,
          json_name: "exclusiveEndIndex",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "start",
          options: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.OneofDescriptorProto{name: "end", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :start, 0

  oneof :end, 1

  field :unbounded_start, 1,
    type: Momento.Protos.CacheClient.Unbounded,
    json_name: "unboundedStart",
    oneof: 0

  field :inclusive_start_index, 2, type: :sint32, json_name: "inclusiveStartIndex", oneof: 0

  field :unbounded_end, 3,
    type: Momento.Protos.CacheClient.Unbounded,
    json_name: "unboundedEnd",
    oneof: 1

  field :exclusive_end_index, 4, type: :sint32, json_name: "exclusiveEndIndex", oneof: 1
end

defmodule Momento.Protos.CacheClient.SortedSetFetchRequest.ByScore.Score do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Score",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "score",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_DOUBLE,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "score",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "exclusive",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BOOL,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "exclusive",
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

  field :score, 1, type: :double
  field :exclusive, 2, type: :bool
end

defmodule Momento.Protos.CacheClient.SortedSetFetchRequest.ByScore do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ByScore",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "unbounded_min",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._Unbounded",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "unboundedMin",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "min_score",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetFetchRequest._ByScore._Score",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "minScore",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "unbounded_max",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._Unbounded",
          default_value: nil,
          options: nil,
          oneof_index: 1,
          json_name: "unboundedMax",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "max_score",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetFetchRequest._ByScore._Score",
          default_value: nil,
          options: nil,
          oneof_index: 1,
          json_name: "maxScore",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "offset",
          extendee: nil,
          number: 5,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "offset",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "count",
          extendee: nil,
          number: 6,
          label: :LABEL_OPTIONAL,
          type: :TYPE_SINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "count",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Score",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "score",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_DOUBLE,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "score",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "exclusive",
              extendee: nil,
              number: 2,
              label: :LABEL_OPTIONAL,
              type: :TYPE_BOOL,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "exclusive",
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "min", options: nil, __unknown_fields__: []},
        %Google.Protobuf.OneofDescriptorProto{name: "max", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :min, 0

  oneof :max, 1

  field :unbounded_min, 1,
    type: Momento.Protos.CacheClient.Unbounded,
    json_name: "unboundedMin",
    oneof: 0

  field :min_score, 2,
    type: Momento.Protos.CacheClient.SortedSetFetchRequest.ByScore.Score,
    json_name: "minScore",
    oneof: 0

  field :unbounded_max, 3,
    type: Momento.Protos.CacheClient.Unbounded,
    json_name: "unboundedMax",
    oneof: 1

  field :max_score, 4,
    type: Momento.Protos.CacheClient.SortedSetFetchRequest.ByScore.Score,
    json_name: "maxScore",
    oneof: 1

  field :offset, 5, type: :uint32
  field :count, 6, type: :sint32
end

defmodule Momento.Protos.CacheClient.SortedSetFetchRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetFetchRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "setName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "order",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_ENUM,
          type_name: ".cache_client._SortedSetFetchRequest.Order",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "order",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "with_scores",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BOOL,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "withScores",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "by_index",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetFetchRequest._ByIndex",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "byIndex",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "by_score",
          extendee: nil,
          number: 5,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetFetchRequest._ByScore",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "byScore",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_ByIndex",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "unbounded_start",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_MESSAGE,
              type_name: ".cache_client._Unbounded",
              default_value: nil,
              options: nil,
              oneof_index: 0,
              json_name: "unboundedStart",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "inclusive_start_index",
              extendee: nil,
              number: 2,
              label: :LABEL_OPTIONAL,
              type: :TYPE_SINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: 0,
              json_name: "inclusiveStartIndex",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "unbounded_end",
              extendee: nil,
              number: 3,
              label: :LABEL_OPTIONAL,
              type: :TYPE_MESSAGE,
              type_name: ".cache_client._Unbounded",
              default_value: nil,
              options: nil,
              oneof_index: 1,
              json_name: "unboundedEnd",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "exclusive_end_index",
              extendee: nil,
              number: 4,
              label: :LABEL_OPTIONAL,
              type: :TYPE_SINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: 1,
              json_name: "exclusiveEndIndex",
              proto3_optional: nil,
              __unknown_fields__: []
            }
          ],
          nested_type: [],
          enum_type: [],
          extension_range: [],
          extension: [],
          options: nil,
          oneof_decl: [
            %Google.Protobuf.OneofDescriptorProto{
              name: "start",
              options: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.OneofDescriptorProto{
              name: "end",
              options: nil,
              __unknown_fields__: []
            }
          ],
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        },
        %Google.Protobuf.DescriptorProto{
          name: "_ByScore",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "unbounded_min",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_MESSAGE,
              type_name: ".cache_client._Unbounded",
              default_value: nil,
              options: nil,
              oneof_index: 0,
              json_name: "unboundedMin",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "min_score",
              extendee: nil,
              number: 2,
              label: :LABEL_OPTIONAL,
              type: :TYPE_MESSAGE,
              type_name: ".cache_client._SortedSetFetchRequest._ByScore._Score",
              default_value: nil,
              options: nil,
              oneof_index: 0,
              json_name: "minScore",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "unbounded_max",
              extendee: nil,
              number: 3,
              label: :LABEL_OPTIONAL,
              type: :TYPE_MESSAGE,
              type_name: ".cache_client._Unbounded",
              default_value: nil,
              options: nil,
              oneof_index: 1,
              json_name: "unboundedMax",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "max_score",
              extendee: nil,
              number: 4,
              label: :LABEL_OPTIONAL,
              type: :TYPE_MESSAGE,
              type_name: ".cache_client._SortedSetFetchRequest._ByScore._Score",
              default_value: nil,
              options: nil,
              oneof_index: 1,
              json_name: "maxScore",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "offset",
              extendee: nil,
              number: 5,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "offset",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "count",
              extendee: nil,
              number: 6,
              label: :LABEL_OPTIONAL,
              type: :TYPE_SINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "count",
              proto3_optional: nil,
              __unknown_fields__: []
            }
          ],
          nested_type: [
            %Google.Protobuf.DescriptorProto{
              name: "_Score",
              field: [
                %Google.Protobuf.FieldDescriptorProto{
                  name: "score",
                  extendee: nil,
                  number: 1,
                  label: :LABEL_OPTIONAL,
                  type: :TYPE_DOUBLE,
                  type_name: nil,
                  default_value: nil,
                  options: nil,
                  oneof_index: nil,
                  json_name: "score",
                  proto3_optional: nil,
                  __unknown_fields__: []
                },
                %Google.Protobuf.FieldDescriptorProto{
                  name: "exclusive",
                  extendee: nil,
                  number: 2,
                  label: :LABEL_OPTIONAL,
                  type: :TYPE_BOOL,
                  type_name: nil,
                  default_value: nil,
                  options: nil,
                  oneof_index: nil,
                  json_name: "exclusive",
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
          ],
          enum_type: [],
          extension_range: [],
          extension: [],
          options: nil,
          oneof_decl: [
            %Google.Protobuf.OneofDescriptorProto{
              name: "min",
              options: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.OneofDescriptorProto{
              name: "max",
              options: nil,
              __unknown_fields__: []
            }
          ],
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        }
      ],
      enum_type: [
        %Google.Protobuf.EnumDescriptorProto{
          name: "Order",
          value: [
            %Google.Protobuf.EnumValueDescriptorProto{
              name: "ASCENDING",
              number: 0,
              options: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.EnumValueDescriptorProto{
              name: "DESCENDING",
              number: 1,
              options: nil,
              __unknown_fields__: []
            }
          ],
          options: nil,
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        }
      ],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "range", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :range, 0

  field :set_name, 1, type: :bytes, json_name: "setName"
  field :order, 2, type: Momento.Protos.CacheClient.SortedSetFetchRequest.Order, enum: true
  field :with_scores, 3, type: :bool, json_name: "withScores"

  field :by_index, 4,
    type: Momento.Protos.CacheClient.SortedSetFetchRequest.ByIndex,
    json_name: "byIndex",
    oneof: 0

  field :by_score, 5,
    type: Momento.Protos.CacheClient.SortedSetFetchRequest.ByScore,
    json_name: "byScore",
    oneof: 0
end

defmodule Momento.Protos.CacheClient.SortedSetFetchResponse.Found.ValuesWithScores do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_ValuesWithScores",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "elements",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetElement",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "elements",
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

  field :elements, 1, repeated: true, type: Momento.Protos.CacheClient.SortedSetElement
end

defmodule Momento.Protos.CacheClient.SortedSetFetchResponse.Found.Values do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Values",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "values",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "values",
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

  field :values, 1, repeated: true, type: :bytes
end

defmodule Momento.Protos.CacheClient.SortedSetFetchResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "values_with_scores",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetFetchResponse._Found._ValuesWithScores",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "valuesWithScores",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "values",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetFetchResponse._Found._Values",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "values",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_ValuesWithScores",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "elements",
              extendee: nil,
              number: 1,
              label: :LABEL_REPEATED,
              type: :TYPE_MESSAGE,
              type_name: ".cache_client._SortedSetElement",
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "elements",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Values",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "values",
              extendee: nil,
              number: 1,
              label: :LABEL_REPEATED,
              type: :TYPE_BYTES,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "values",
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "elements",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :elements, 0

  field :values_with_scores, 1,
    type: Momento.Protos.CacheClient.SortedSetFetchResponse.Found.ValuesWithScores,
    json_name: "valuesWithScores",
    oneof: 0

  field :values, 2, type: Momento.Protos.CacheClient.SortedSetFetchResponse.Found.Values, oneof: 0
end

defmodule Momento.Protos.CacheClient.SortedSetFetchResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SortedSetFetchResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetFetchResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetFetchResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetFetchResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "values_with_scores",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_MESSAGE,
              type_name: ".cache_client._SortedSetFetchResponse._Found._ValuesWithScores",
              default_value: nil,
              options: nil,
              oneof_index: 0,
              json_name: "valuesWithScores",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "values",
              extendee: nil,
              number: 2,
              label: :LABEL_OPTIONAL,
              type: :TYPE_MESSAGE,
              type_name: ".cache_client._SortedSetFetchResponse._Found._Values",
              default_value: nil,
              options: nil,
              oneof_index: 0,
              json_name: "values",
              proto3_optional: nil,
              __unknown_fields__: []
            }
          ],
          nested_type: [
            %Google.Protobuf.DescriptorProto{
              name: "_ValuesWithScores",
              field: [
                %Google.Protobuf.FieldDescriptorProto{
                  name: "elements",
                  extendee: nil,
                  number: 1,
                  label: :LABEL_REPEATED,
                  type: :TYPE_MESSAGE,
                  type_name: ".cache_client._SortedSetElement",
                  default_value: nil,
                  options: nil,
                  oneof_index: nil,
                  json_name: "elements",
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
            },
            %Google.Protobuf.DescriptorProto{
              name: "_Values",
              field: [
                %Google.Protobuf.FieldDescriptorProto{
                  name: "values",
                  extendee: nil,
                  number: 1,
                  label: :LABEL_REPEATED,
                  type: :TYPE_BYTES,
                  type_name: nil,
                  default_value: nil,
                  options: nil,
                  oneof_index: nil,
                  json_name: "values",
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
          ],
          enum_type: [],
          extension_range: [],
          extension: [],
          options: nil,
          oneof_decl: [
            %Google.Protobuf.OneofDescriptorProto{
              name: "elements",
              options: nil,
              __unknown_fields__: []
            }
          ],
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "sorted_set",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :sorted_set, 0

  field :found, 1, type: Momento.Protos.CacheClient.SortedSetFetchResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.SortedSetFetchResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.SortedSetGetScoreRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetGetScoreRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "setName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "values",
          extendee: nil,
          number: 2,
          label: :LABEL_REPEATED,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "values",
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

  field :set_name, 1, type: :bytes, json_name: "setName"
  field :values, 2, repeated: true, type: :bytes
end

defmodule Momento.Protos.CacheClient.SortedSetGetScoreResponse.SortedSetGetScoreResponsePart do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetGetScoreResponsePart",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "result",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_ENUM,
          type_name: ".cache_client.ECacheResult",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "result",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "score",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_DOUBLE,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "score",
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

  field :result, 1, type: Momento.Protos.CacheClient.ECacheResult, enum: true
  field :score, 2, type: :double
end

defmodule Momento.Protos.CacheClient.SortedSetGetScoreResponse.SortedSetFound do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetFound",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "elements",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetGetScoreResponse._SortedSetGetScoreResponsePart",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "elements",
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

  field :elements, 1,
    repeated: true,
    type: Momento.Protos.CacheClient.SortedSetGetScoreResponse.SortedSetGetScoreResponsePart
end

defmodule Momento.Protos.CacheClient.SortedSetGetScoreResponse.SortedSetMissing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetMissing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SortedSetGetScoreResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetGetScoreResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetGetScoreResponse._SortedSetFound",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetGetScoreResponse._SortedSetMissing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_SortedSetGetScoreResponsePart",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "result",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_ENUM,
              type_name: ".cache_client.ECacheResult",
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "result",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "score",
              extendee: nil,
              number: 2,
              label: :LABEL_OPTIONAL,
              type: :TYPE_DOUBLE,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "score",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_SortedSetFound",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "elements",
              extendee: nil,
              number: 1,
              label: :LABEL_REPEATED,
              type: :TYPE_MESSAGE,
              type_name:
                ".cache_client._SortedSetGetScoreResponse._SortedSetGetScoreResponsePart",
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "elements",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_SortedSetMissing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "sorted_set",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :sorted_set, 0

  field :found, 1,
    type: Momento.Protos.CacheClient.SortedSetGetScoreResponse.SortedSetFound,
    oneof: 0

  field :missing, 2,
    type: Momento.Protos.CacheClient.SortedSetGetScoreResponse.SortedSetMissing,
    oneof: 0
end

defmodule Momento.Protos.CacheClient.SortedSetRemoveRequest.All do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_All",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SortedSetRemoveRequest.Some do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Some",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "values",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "values",
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

  field :values, 1, repeated: true, type: :bytes
end

defmodule Momento.Protos.CacheClient.SortedSetRemoveRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetRemoveRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "setName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "all",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetRemoveRequest._All",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "all",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "some",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetRemoveRequest._Some",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "some",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_All",
          field: [],
          nested_type: [],
          enum_type: [],
          extension_range: [],
          extension: [],
          options: nil,
          oneof_decl: [],
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Some",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "values",
              extendee: nil,
              number: 1,
              label: :LABEL_REPEATED,
              type: :TYPE_BYTES,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "values",
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "remove_elements",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :remove_elements, 0

  field :set_name, 1, type: :bytes, json_name: "setName"
  field :all, 2, type: Momento.Protos.CacheClient.SortedSetRemoveRequest.All, oneof: 0
  field :some, 3, type: Momento.Protos.CacheClient.SortedSetRemoveRequest.Some, oneof: 0
end

defmodule Momento.Protos.CacheClient.SortedSetRemoveResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetRemoveResponse",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SortedSetIncrementRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetIncrementRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "setName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "value",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "value",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "amount",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_DOUBLE,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "amount",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "ttl_milliseconds",
          extendee: nil,
          number: 4,
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
          name: "refresh_ttl",
          extendee: nil,
          number: 5,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BOOL,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "refreshTtl",
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

  field :set_name, 1, type: :bytes, json_name: "setName"
  field :value, 2, type: :bytes
  field :amount, 3, type: :double
  field :ttl_milliseconds, 4, type: :uint64, json_name: "ttlMilliseconds"
  field :refresh_ttl, 5, type: :bool, json_name: "refreshTtl"
end

defmodule Momento.Protos.CacheClient.SortedSetIncrementResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetIncrementResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "score",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_DOUBLE,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "score",
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

  field :score, 1, type: :double
end

defmodule Momento.Protos.CacheClient.SortedSetGetRankRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetGetRankRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "setName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "value",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "value",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "order",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_ENUM,
          type_name: ".cache_client._SortedSetGetRankRequest.Order",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "order",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [],
      enum_type: [
        %Google.Protobuf.EnumDescriptorProto{
          name: "Order",
          value: [
            %Google.Protobuf.EnumValueDescriptorProto{
              name: "ASCENDING",
              number: 0,
              options: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.EnumValueDescriptorProto{
              name: "DESCENDING",
              number: 1,
              options: nil,
              __unknown_fields__: []
            }
          ],
          options: nil,
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        }
      ],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  field :set_name, 1, type: :bytes, json_name: "setName"
  field :value, 2, type: :bytes
  field :order, 3, type: Momento.Protos.CacheClient.SortedSetGetRankRequest.Order, enum: true
end

defmodule Momento.Protos.CacheClient.SortedSetGetRankResponse.RankResponsePart do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_RankResponsePart",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "result",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_ENUM,
          type_name: ".cache_client.ECacheResult",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "result",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "rank",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT64,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "rank",
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

  field :result, 1, type: Momento.Protos.CacheClient.ECacheResult, enum: true
  field :rank, 2, type: :uint64
end

defmodule Momento.Protos.CacheClient.SortedSetGetRankResponse.SortedSetMissing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetMissing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SortedSetGetRankResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetGetRankResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "element_rank",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetGetRankResponse._RankResponsePart",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "elementRank",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetGetRankResponse._SortedSetMissing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_RankResponsePart",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "result",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_ENUM,
              type_name: ".cache_client.ECacheResult",
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "result",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "rank",
              extendee: nil,
              number: 2,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT64,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "rank",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_SortedSetMissing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "rank", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :rank, 0

  field :element_rank, 1,
    type: Momento.Protos.CacheClient.SortedSetGetRankResponse.RankResponsePart,
    json_name: "elementRank",
    oneof: 0

  field :missing, 2,
    type: Momento.Protos.CacheClient.SortedSetGetRankResponse.SortedSetMissing,
    oneof: 0
end

defmodule Momento.Protos.CacheClient.SortedSetLengthRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetLengthRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "setName",
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

  field :set_name, 1, type: :bytes, json_name: "setName"
end

defmodule Momento.Protos.CacheClient.SortedSetLengthResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "length",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "length",
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

  field :length, 1, type: :uint32
end

defmodule Momento.Protos.CacheClient.SortedSetLengthResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SortedSetLengthResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetLengthResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetLengthResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetLengthResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "length",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "length",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "sorted_set",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :sorted_set, 0

  field :found, 1, type: Momento.Protos.CacheClient.SortedSetLengthResponse.Found, oneof: 0
  field :missing, 2, type: Momento.Protos.CacheClient.SortedSetLengthResponse.Missing, oneof: 0
end

defmodule Momento.Protos.CacheClient.SortedSetLengthByScoreRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetLengthByScoreRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "set_name",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_BYTES,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "setName",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "inclusive_min",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_DOUBLE,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "inclusiveMin",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "exclusive_min",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_DOUBLE,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "exclusiveMin",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "unbounded_min",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._Unbounded",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "unboundedMin",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "inclusive_max",
          extendee: nil,
          number: 5,
          label: :LABEL_OPTIONAL,
          type: :TYPE_DOUBLE,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: 1,
          json_name: "inclusiveMax",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "exclusive_max",
          extendee: nil,
          number: 6,
          label: :LABEL_OPTIONAL,
          type: :TYPE_DOUBLE,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: 1,
          json_name: "exclusiveMax",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "unbounded_max",
          extendee: nil,
          number: 7,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._Unbounded",
          default_value: nil,
          options: nil,
          oneof_index: 1,
          json_name: "unboundedMax",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{name: "min", options: nil, __unknown_fields__: []},
        %Google.Protobuf.OneofDescriptorProto{name: "max", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :min, 0

  oneof :max, 1

  field :set_name, 1, type: :bytes, json_name: "setName"
  field :inclusive_min, 2, type: :double, json_name: "inclusiveMin", oneof: 0
  field :exclusive_min, 3, type: :double, json_name: "exclusiveMin", oneof: 0

  field :unbounded_min, 4,
    type: Momento.Protos.CacheClient.Unbounded,
    json_name: "unboundedMin",
    oneof: 0

  field :inclusive_max, 5, type: :double, json_name: "inclusiveMax", oneof: 1
  field :exclusive_max, 6, type: :double, json_name: "exclusiveMax", oneof: 1

  field :unbounded_max, 7,
    type: Momento.Protos.CacheClient.Unbounded,
    json_name: "unboundedMax",
    oneof: 1
end

defmodule Momento.Protos.CacheClient.SortedSetLengthByScoreResponse.Found do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Found",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "length",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "length",
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

  field :length, 1, type: :uint32
end

defmodule Momento.Protos.CacheClient.SortedSetLengthByScoreResponse.Missing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_Missing",
      field: [],
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
end

defmodule Momento.Protos.CacheClient.SortedSetLengthByScoreResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_SortedSetLengthByScoreResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "found",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetLengthByScoreResponse._Found",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "found",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "missing",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".cache_client._SortedSetLengthByScoreResponse._Missing",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "missing",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "_Found",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "length",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "length",
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
        },
        %Google.Protobuf.DescriptorProto{
          name: "_Missing",
          field: [],
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
      ],
      enum_type: [],
      extension_range: [],
      extension: [],
      options: nil,
      oneof_decl: [
        %Google.Protobuf.OneofDescriptorProto{
          name: "sorted_set",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :sorted_set, 0

  field :found, 1, type: Momento.Protos.CacheClient.SortedSetLengthByScoreResponse.Found, oneof: 0

  field :missing, 2,
    type: Momento.Protos.CacheClient.SortedSetLengthByScoreResponse.Missing,
    oneof: 0
end

defmodule Momento.Protos.CacheClient.Scs.Service do
  @moduledoc false

  use GRPC.Service, name: "cache_client.Scs", protoc_gen_elixir_version: "0.12.0"

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.ServiceDescriptorProto{
      name: "Scs",
      method: [
        %Google.Protobuf.MethodDescriptorProto{
          name: "Get",
          input_type: ".cache_client._GetRequest",
          output_type: ".cache_client._GetResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "Set",
          input_type: ".cache_client._SetRequest",
          output_type: ".cache_client._SetResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SetIfNotExists",
          input_type: ".cache_client._SetIfNotExistsRequest",
          output_type: ".cache_client._SetIfNotExistsResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "Delete",
          input_type: ".cache_client._DeleteRequest",
          output_type: ".cache_client._DeleteResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "KeysExist",
          input_type: ".cache_client._KeysExistRequest",
          output_type: ".cache_client._KeysExistResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "Increment",
          input_type: ".cache_client._IncrementRequest",
          output_type: ".cache_client._IncrementResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "UpdateTtl",
          input_type: ".cache_client._UpdateTtlRequest",
          output_type: ".cache_client._UpdateTtlResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "ItemGetTtl",
          input_type: ".cache_client._ItemGetTtlRequest",
          output_type: ".cache_client._ItemGetTtlResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "ItemGetType",
          input_type: ".cache_client._ItemGetTypeRequest",
          output_type: ".cache_client._ItemGetTypeResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "DictionaryGet",
          input_type: ".cache_client._DictionaryGetRequest",
          output_type: ".cache_client._DictionaryGetResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "DictionaryFetch",
          input_type: ".cache_client._DictionaryFetchRequest",
          output_type: ".cache_client._DictionaryFetchResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "DictionarySet",
          input_type: ".cache_client._DictionarySetRequest",
          output_type: ".cache_client._DictionarySetResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "DictionaryIncrement",
          input_type: ".cache_client._DictionaryIncrementRequest",
          output_type: ".cache_client._DictionaryIncrementResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "DictionaryDelete",
          input_type: ".cache_client._DictionaryDeleteRequest",
          output_type: ".cache_client._DictionaryDeleteResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "DictionaryLength",
          input_type: ".cache_client._DictionaryLengthRequest",
          output_type: ".cache_client._DictionaryLengthResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SetFetch",
          input_type: ".cache_client._SetFetchRequest",
          output_type: ".cache_client._SetFetchResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SetUnion",
          input_type: ".cache_client._SetUnionRequest",
          output_type: ".cache_client._SetUnionResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SetDifference",
          input_type: ".cache_client._SetDifferenceRequest",
          output_type: ".cache_client._SetDifferenceResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SetContains",
          input_type: ".cache_client._SetContainsRequest",
          output_type: ".cache_client._SetContainsResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SetLength",
          input_type: ".cache_client._SetLengthRequest",
          output_type: ".cache_client._SetLengthResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "ListPushFront",
          input_type: ".cache_client._ListPushFrontRequest",
          output_type: ".cache_client._ListPushFrontResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "ListPushBack",
          input_type: ".cache_client._ListPushBackRequest",
          output_type: ".cache_client._ListPushBackResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "ListPopFront",
          input_type: ".cache_client._ListPopFrontRequest",
          output_type: ".cache_client._ListPopFrontResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "ListPopBack",
          input_type: ".cache_client._ListPopBackRequest",
          output_type: ".cache_client._ListPopBackResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "ListErase",
          input_type: ".cache_client._ListEraseRequest",
          output_type: ".cache_client._ListEraseResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "ListRemove",
          input_type: ".cache_client._ListRemoveRequest",
          output_type: ".cache_client._ListRemoveResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "ListFetch",
          input_type: ".cache_client._ListFetchRequest",
          output_type: ".cache_client._ListFetchResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "ListLength",
          input_type: ".cache_client._ListLengthRequest",
          output_type: ".cache_client._ListLengthResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "ListConcatenateFront",
          input_type: ".cache_client._ListConcatenateFrontRequest",
          output_type: ".cache_client._ListConcatenateFrontResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "ListConcatenateBack",
          input_type: ".cache_client._ListConcatenateBackRequest",
          output_type: ".cache_client._ListConcatenateBackResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "ListRetain",
          input_type: ".cache_client._ListRetainRequest",
          output_type: ".cache_client._ListRetainResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SortedSetPut",
          input_type: ".cache_client._SortedSetPutRequest",
          output_type: ".cache_client._SortedSetPutResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SortedSetFetch",
          input_type: ".cache_client._SortedSetFetchRequest",
          output_type: ".cache_client._SortedSetFetchResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SortedSetGetScore",
          input_type: ".cache_client._SortedSetGetScoreRequest",
          output_type: ".cache_client._SortedSetGetScoreResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SortedSetRemove",
          input_type: ".cache_client._SortedSetRemoveRequest",
          output_type: ".cache_client._SortedSetRemoveResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SortedSetIncrement",
          input_type: ".cache_client._SortedSetIncrementRequest",
          output_type: ".cache_client._SortedSetIncrementResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SortedSetGetRank",
          input_type: ".cache_client._SortedSetGetRankRequest",
          output_type: ".cache_client._SortedSetGetRankResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SortedSetLength",
          input_type: ".cache_client._SortedSetLengthRequest",
          output_type: ".cache_client._SortedSetLengthResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: false,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "SortedSetLengthByScore",
          input_type: ".cache_client._SortedSetLengthByScoreRequest",
          output_type: ".cache_client._SortedSetLengthByScoreResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
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

  rpc :Get, Momento.Protos.CacheClient.GetRequest, Momento.Protos.CacheClient.GetResponse

  rpc :Set, Momento.Protos.CacheClient.SetRequest, Momento.Protos.CacheClient.SetResponse

  rpc :SetIfNotExists,
      Momento.Protos.CacheClient.SetIfNotExistsRequest,
      Momento.Protos.CacheClient.SetIfNotExistsResponse

  rpc :Delete, Momento.Protos.CacheClient.DeleteRequest, Momento.Protos.CacheClient.DeleteResponse

  rpc :KeysExist,
      Momento.Protos.CacheClient.KeysExistRequest,
      Momento.Protos.CacheClient.KeysExistResponse

  rpc :Increment,
      Momento.Protos.CacheClient.IncrementRequest,
      Momento.Protos.CacheClient.IncrementResponse

  rpc :UpdateTtl,
      Momento.Protos.CacheClient.UpdateTtlRequest,
      Momento.Protos.CacheClient.UpdateTtlResponse

  rpc :ItemGetTtl,
      Momento.Protos.CacheClient.ItemGetTtlRequest,
      Momento.Protos.CacheClient.ItemGetTtlResponse

  rpc :ItemGetType,
      Momento.Protos.CacheClient.ItemGetTypeRequest,
      Momento.Protos.CacheClient.ItemGetTypeResponse

  rpc :DictionaryGet,
      Momento.Protos.CacheClient.DictionaryGetRequest,
      Momento.Protos.CacheClient.DictionaryGetResponse

  rpc :DictionaryFetch,
      Momento.Protos.CacheClient.DictionaryFetchRequest,
      Momento.Protos.CacheClient.DictionaryFetchResponse

  rpc :DictionarySet,
      Momento.Protos.CacheClient.DictionarySetRequest,
      Momento.Protos.CacheClient.DictionarySetResponse

  rpc :DictionaryIncrement,
      Momento.Protos.CacheClient.DictionaryIncrementRequest,
      Momento.Protos.CacheClient.DictionaryIncrementResponse

  rpc :DictionaryDelete,
      Momento.Protos.CacheClient.DictionaryDeleteRequest,
      Momento.Protos.CacheClient.DictionaryDeleteResponse

  rpc :DictionaryLength,
      Momento.Protos.CacheClient.DictionaryLengthRequest,
      Momento.Protos.CacheClient.DictionaryLengthResponse

  rpc :SetFetch,
      Momento.Protos.CacheClient.SetFetchRequest,
      Momento.Protos.CacheClient.SetFetchResponse

  rpc :SetUnion,
      Momento.Protos.CacheClient.SetUnionRequest,
      Momento.Protos.CacheClient.SetUnionResponse

  rpc :SetDifference,
      Momento.Protos.CacheClient.SetDifferenceRequest,
      Momento.Protos.CacheClient.SetDifferenceResponse

  rpc :SetContains,
      Momento.Protos.CacheClient.SetContainsRequest,
      Momento.Protos.CacheClient.SetContainsResponse

  rpc :SetLength,
      Momento.Protos.CacheClient.SetLengthRequest,
      Momento.Protos.CacheClient.SetLengthResponse

  rpc :ListPushFront,
      Momento.Protos.CacheClient.ListPushFrontRequest,
      Momento.Protos.CacheClient.ListPushFrontResponse

  rpc :ListPushBack,
      Momento.Protos.CacheClient.ListPushBackRequest,
      Momento.Protos.CacheClient.ListPushBackResponse

  rpc :ListPopFront,
      Momento.Protos.CacheClient.ListPopFrontRequest,
      Momento.Protos.CacheClient.ListPopFrontResponse

  rpc :ListPopBack,
      Momento.Protos.CacheClient.ListPopBackRequest,
      Momento.Protos.CacheClient.ListPopBackResponse

  rpc :ListErase,
      Momento.Protos.CacheClient.ListEraseRequest,
      Momento.Protos.CacheClient.ListEraseResponse

  rpc :ListRemove,
      Momento.Protos.CacheClient.ListRemoveRequest,
      Momento.Protos.CacheClient.ListRemoveResponse

  rpc :ListFetch,
      Momento.Protos.CacheClient.ListFetchRequest,
      Momento.Protos.CacheClient.ListFetchResponse

  rpc :ListLength,
      Momento.Protos.CacheClient.ListLengthRequest,
      Momento.Protos.CacheClient.ListLengthResponse

  rpc :ListConcatenateFront,
      Momento.Protos.CacheClient.ListConcatenateFrontRequest,
      Momento.Protos.CacheClient.ListConcatenateFrontResponse

  rpc :ListConcatenateBack,
      Momento.Protos.CacheClient.ListConcatenateBackRequest,
      Momento.Protos.CacheClient.ListConcatenateBackResponse

  rpc :ListRetain,
      Momento.Protos.CacheClient.ListRetainRequest,
      Momento.Protos.CacheClient.ListRetainResponse

  rpc :SortedSetPut,
      Momento.Protos.CacheClient.SortedSetPutRequest,
      Momento.Protos.CacheClient.SortedSetPutResponse

  rpc :SortedSetFetch,
      Momento.Protos.CacheClient.SortedSetFetchRequest,
      Momento.Protos.CacheClient.SortedSetFetchResponse

  rpc :SortedSetGetScore,
      Momento.Protos.CacheClient.SortedSetGetScoreRequest,
      Momento.Protos.CacheClient.SortedSetGetScoreResponse

  rpc :SortedSetRemove,
      Momento.Protos.CacheClient.SortedSetRemoveRequest,
      Momento.Protos.CacheClient.SortedSetRemoveResponse

  rpc :SortedSetIncrement,
      Momento.Protos.CacheClient.SortedSetIncrementRequest,
      Momento.Protos.CacheClient.SortedSetIncrementResponse

  rpc :SortedSetGetRank,
      Momento.Protos.CacheClient.SortedSetGetRankRequest,
      Momento.Protos.CacheClient.SortedSetGetRankResponse

  rpc :SortedSetLength,
      Momento.Protos.CacheClient.SortedSetLengthRequest,
      Momento.Protos.CacheClient.SortedSetLengthResponse

  rpc :SortedSetLengthByScore,
      Momento.Protos.CacheClient.SortedSetLengthByScoreRequest,
      Momento.Protos.CacheClient.SortedSetLengthByScoreResponse
end

defmodule Momento.Protos.CacheClient.Scs.Stub do
  @moduledoc false

  use GRPC.Stub, service: Momento.Protos.CacheClient.Scs.Service
end