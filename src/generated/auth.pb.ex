defmodule Auth.GenerateApiTokenRequest.CacheRole do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.EnumDescriptorProto{
      name: "CacheRole",
      value: [
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "CachePermitNone",
          number: 0,
          options: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "CacheReadWrite",
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

  field :CachePermitNone, 0
  field :CacheReadWrite, 1
end

defmodule Auth.GenerateApiTokenRequest.TopicRole do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.EnumDescriptorProto{
      name: "TopicRole",
      value: [
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "TopicPermitNone",
          number: 0,
          options: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "TopicReadWrite",
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

  field :TopicPermitNone, 0
  field :TopicReadWrite, 1
end

defmodule Auth.GenerateApiTokenRequest.SuperUserPermissions do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.EnumDescriptorProto{
      name: "SuperUserPermissions",
      value: [
        %Google.Protobuf.EnumValueDescriptorProto{
          name: "SuperUser",
          number: 0,
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

  field :SuperUser, 0
end

defmodule Auth.LoginRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_LoginRequest",
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

defmodule Auth.LoginResponse.LoggedIn do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "LoggedIn",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "session_token",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "sessionToken",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "valid_for_seconds",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "validForSeconds",
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

  field :session_token, 1, type: :string, json_name: "sessionToken"
  field :valid_for_seconds, 2, type: :uint32, json_name: "validForSeconds"
end

defmodule Auth.LoginResponse.Error do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "Error",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "description",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "description",
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

  field :description, 1, type: :string
end

defmodule Auth.LoginResponse.DirectBrowser do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "DirectBrowser",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "url",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "url",
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

  field :url, 1, type: :string
end

defmodule Auth.LoginResponse.Message do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "Message",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "text",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "text",
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

  field :text, 1, type: :string
end

defmodule Auth.LoginResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_LoginResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "direct_browser",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".auth._LoginResponse.DirectBrowser",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "directBrowser",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "logged_in",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".auth._LoginResponse.LoggedIn",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "loggedIn",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "message",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".auth._LoginResponse.Message",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "message",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "error",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".auth._LoginResponse.Error",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "error",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "LoggedIn",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "session_token",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_STRING,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "sessionToken",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "valid_for_seconds",
              extendee: nil,
              number: 2,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "validForSeconds",
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
          name: "Error",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "description",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_STRING,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "description",
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
          name: "DirectBrowser",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "url",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_STRING,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "url",
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
          name: "Message",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "text",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_STRING,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "text",
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
        %Google.Protobuf.OneofDescriptorProto{name: "state", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :state, 0

  field :direct_browser, 1,
    type: Auth.LoginResponse.DirectBrowser,
    json_name: "directBrowser",
    oneof: 0

  field :logged_in, 2, type: Auth.LoginResponse.LoggedIn, json_name: "loggedIn", oneof: 0
  field :message, 3, type: Auth.LoginResponse.Message, oneof: 0
  field :error, 4, type: Auth.LoginResponse.Error, oneof: 0
end

defmodule Auth.GenerateApiTokenRequest.Never do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "Never",
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

defmodule Auth.GenerateApiTokenRequest.Expires do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "Expires",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "valid_for_seconds",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT32,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "validForSeconds",
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

  field :valid_for_seconds, 1, type: :uint32, json_name: "validForSeconds"
end

defmodule Auth.GenerateApiTokenRequest.Permissions do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "Permissions",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "super_user",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_ENUM,
          type_name: ".auth._GenerateApiTokenRequest.SuperUserPermissions",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "superUser",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "explicit",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".auth._GenerateApiTokenRequest.ExplicitPermissions",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "explicit",
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
        %Google.Protobuf.OneofDescriptorProto{name: "kind", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :kind, 0

  field :super_user, 1,
    type: Auth.GenerateApiTokenRequest.SuperUserPermissions,
    json_name: "superUser",
    enum: true,
    oneof: 0

  field :explicit, 2, type: Auth.GenerateApiTokenRequest.ExplicitPermissions, oneof: 0
end

defmodule Auth.GenerateApiTokenRequest.ExplicitPermissions do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "ExplicitPermissions",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "permissions",
          extendee: nil,
          number: 1,
          label: :LABEL_REPEATED,
          type: :TYPE_MESSAGE,
          type_name: ".auth._GenerateApiTokenRequest.PermissionsType",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "permissions",
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

  field :permissions, 1, repeated: true, type: Auth.GenerateApiTokenRequest.PermissionsType
end

defmodule Auth.GenerateApiTokenRequest.PermissionsType.CachePermissions do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "CachePermissions",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "role",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_ENUM,
          type_name: ".auth._GenerateApiTokenRequest.CacheRole",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "role",
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

  field :role, 1, type: Auth.GenerateApiTokenRequest.CacheRole, enum: true
end

defmodule Auth.GenerateApiTokenRequest.PermissionsType.TopicPermissions do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "TopicPermissions",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "role",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_ENUM,
          type_name: ".auth._GenerateApiTokenRequest.TopicRole",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "role",
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

  field :role, 1, type: Auth.GenerateApiTokenRequest.TopicRole, enum: true
end

defmodule Auth.GenerateApiTokenRequest.PermissionsType do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "PermissionsType",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "cache_permissions",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".auth._GenerateApiTokenRequest.PermissionsType.CachePermissions",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "cachePermissions",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "topic_permissions",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".auth._GenerateApiTokenRequest.PermissionsType.TopicPermissions",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "topicPermissions",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "CachePermissions",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "role",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_ENUM,
              type_name: ".auth._GenerateApiTokenRequest.CacheRole",
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "role",
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
          name: "TopicPermissions",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "role",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_ENUM,
              type_name: ".auth._GenerateApiTokenRequest.TopicRole",
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "role",
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
        %Google.Protobuf.OneofDescriptorProto{name: "kind", options: nil, __unknown_fields__: []}
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :kind, 0

  field :cache_permissions, 1,
    type: Auth.GenerateApiTokenRequest.PermissionsType.CachePermissions,
    json_name: "cachePermissions",
    oneof: 0

  field :topic_permissions, 2,
    type: Auth.GenerateApiTokenRequest.PermissionsType.TopicPermissions,
    json_name: "topicPermissions",
    oneof: 0
end

defmodule Auth.GenerateApiTokenRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_GenerateApiTokenRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "never",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".auth._GenerateApiTokenRequest.Never",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "never",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "expires",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".auth._GenerateApiTokenRequest.Expires",
          default_value: nil,
          options: nil,
          oneof_index: 0,
          json_name: "expires",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "auth_token",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "authToken",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "permissions",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_MESSAGE,
          type_name: ".auth._GenerateApiTokenRequest.Permissions",
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "permissions",
          proto3_optional: nil,
          __unknown_fields__: []
        }
      ],
      nested_type: [
        %Google.Protobuf.DescriptorProto{
          name: "Never",
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
          name: "Expires",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "valid_for_seconds",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_UINT32,
              type_name: nil,
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "validForSeconds",
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
          name: "Permissions",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "super_user",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_ENUM,
              type_name: ".auth._GenerateApiTokenRequest.SuperUserPermissions",
              default_value: nil,
              options: nil,
              oneof_index: 0,
              json_name: "superUser",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "explicit",
              extendee: nil,
              number: 2,
              label: :LABEL_OPTIONAL,
              type: :TYPE_MESSAGE,
              type_name: ".auth._GenerateApiTokenRequest.ExplicitPermissions",
              default_value: nil,
              options: nil,
              oneof_index: 0,
              json_name: "explicit",
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
              name: "kind",
              options: nil,
              __unknown_fields__: []
            }
          ],
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        },
        %Google.Protobuf.DescriptorProto{
          name: "ExplicitPermissions",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "permissions",
              extendee: nil,
              number: 1,
              label: :LABEL_REPEATED,
              type: :TYPE_MESSAGE,
              type_name: ".auth._GenerateApiTokenRequest.PermissionsType",
              default_value: nil,
              options: nil,
              oneof_index: nil,
              json_name: "permissions",
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
          name: "PermissionsType",
          field: [
            %Google.Protobuf.FieldDescriptorProto{
              name: "cache_permissions",
              extendee: nil,
              number: 1,
              label: :LABEL_OPTIONAL,
              type: :TYPE_MESSAGE,
              type_name: ".auth._GenerateApiTokenRequest.PermissionsType.CachePermissions",
              default_value: nil,
              options: nil,
              oneof_index: 0,
              json_name: "cachePermissions",
              proto3_optional: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.FieldDescriptorProto{
              name: "topic_permissions",
              extendee: nil,
              number: 2,
              label: :LABEL_OPTIONAL,
              type: :TYPE_MESSAGE,
              type_name: ".auth._GenerateApiTokenRequest.PermissionsType.TopicPermissions",
              default_value: nil,
              options: nil,
              oneof_index: 0,
              json_name: "topicPermissions",
              proto3_optional: nil,
              __unknown_fields__: []
            }
          ],
          nested_type: [
            %Google.Protobuf.DescriptorProto{
              name: "CachePermissions",
              field: [
                %Google.Protobuf.FieldDescriptorProto{
                  name: "role",
                  extendee: nil,
                  number: 1,
                  label: :LABEL_OPTIONAL,
                  type: :TYPE_ENUM,
                  type_name: ".auth._GenerateApiTokenRequest.CacheRole",
                  default_value: nil,
                  options: nil,
                  oneof_index: nil,
                  json_name: "role",
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
              name: "TopicPermissions",
              field: [
                %Google.Protobuf.FieldDescriptorProto{
                  name: "role",
                  extendee: nil,
                  number: 1,
                  label: :LABEL_OPTIONAL,
                  type: :TYPE_ENUM,
                  type_name: ".auth._GenerateApiTokenRequest.TopicRole",
                  default_value: nil,
                  options: nil,
                  oneof_index: nil,
                  json_name: "role",
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
              name: "kind",
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
          name: "CacheRole",
          value: [
            %Google.Protobuf.EnumValueDescriptorProto{
              name: "CachePermitNone",
              number: 0,
              options: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.EnumValueDescriptorProto{
              name: "CacheReadWrite",
              number: 1,
              options: nil,
              __unknown_fields__: []
            }
          ],
          options: nil,
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        },
        %Google.Protobuf.EnumDescriptorProto{
          name: "TopicRole",
          value: [
            %Google.Protobuf.EnumValueDescriptorProto{
              name: "TopicPermitNone",
              number: 0,
              options: nil,
              __unknown_fields__: []
            },
            %Google.Protobuf.EnumValueDescriptorProto{
              name: "TopicReadWrite",
              number: 1,
              options: nil,
              __unknown_fields__: []
            }
          ],
          options: nil,
          reserved_range: [],
          reserved_name: [],
          __unknown_fields__: []
        },
        %Google.Protobuf.EnumDescriptorProto{
          name: "SuperUserPermissions",
          value: [
            %Google.Protobuf.EnumValueDescriptorProto{
              name: "SuperUser",
              number: 0,
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
          name: "expiry",
          options: nil,
          __unknown_fields__: []
        }
      ],
      reserved_range: [],
      reserved_name: [],
      __unknown_fields__: []
    }
  end

  oneof :expiry, 0

  field :never, 1, type: Auth.GenerateApiTokenRequest.Never, oneof: 0
  field :expires, 2, type: Auth.GenerateApiTokenRequest.Expires, oneof: 0
  field :auth_token, 3, type: :string, json_name: "authToken"
  field :permissions, 4, type: Auth.GenerateApiTokenRequest.Permissions
end

defmodule Auth.GenerateApiTokenResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_GenerateApiTokenResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "api_key",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "apiKey",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "refresh_token",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "refreshToken",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "endpoint",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "endpoint",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "valid_until",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT64,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "validUntil",
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

  field :api_key, 1, type: :string, json_name: "apiKey"
  field :refresh_token, 2, type: :string, json_name: "refreshToken"
  field :endpoint, 3, type: :string
  field :valid_until, 4, type: :uint64, json_name: "validUntil"
end

defmodule Auth.RefreshApiTokenRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_RefreshApiTokenRequest",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "api_key",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "apiKey",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "refresh_token",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "refreshToken",
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

  field :api_key, 1, type: :string, json_name: "apiKey"
  field :refresh_token, 2, type: :string, json_name: "refreshToken"
end

defmodule Auth.RefreshApiTokenResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.DescriptorProto{
      name: "_RefreshApiTokenResponse",
      field: [
        %Google.Protobuf.FieldDescriptorProto{
          name: "api_key",
          extendee: nil,
          number: 1,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "apiKey",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "refresh_token",
          extendee: nil,
          number: 2,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "refreshToken",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "endpoint",
          extendee: nil,
          number: 3,
          label: :LABEL_OPTIONAL,
          type: :TYPE_STRING,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "endpoint",
          proto3_optional: nil,
          __unknown_fields__: []
        },
        %Google.Protobuf.FieldDescriptorProto{
          name: "valid_until",
          extendee: nil,
          number: 4,
          label: :LABEL_OPTIONAL,
          type: :TYPE_UINT64,
          type_name: nil,
          default_value: nil,
          options: nil,
          oneof_index: nil,
          json_name: "validUntil",
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

  field :api_key, 1, type: :string, json_name: "apiKey"
  field :refresh_token, 2, type: :string, json_name: "refreshToken"
  field :endpoint, 3, type: :string
  field :valid_until, 4, type: :uint64, json_name: "validUntil"
end

defmodule Auth.Auth.Service do
  @moduledoc false

  use GRPC.Service, name: "auth.Auth", protoc_gen_elixir_version: "0.12.0"

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.ServiceDescriptorProto{
      name: "Auth",
      method: [
        %Google.Protobuf.MethodDescriptorProto{
          name: "Login",
          input_type: ".auth._LoginRequest",
          output_type: ".auth._LoginResponse",
          options: %Google.Protobuf.MethodOptions{
            deprecated: false,
            idempotency_level: :IDEMPOTENCY_UNKNOWN,
            uninterpreted_option: [],
            __pb_extensions__: %{},
            __unknown_fields__: []
          },
          client_streaming: false,
          server_streaming: true,
          __unknown_fields__: []
        },
        %Google.Protobuf.MethodDescriptorProto{
          name: "GenerateApiToken",
          input_type: ".auth._GenerateApiTokenRequest",
          output_type: ".auth._GenerateApiTokenResponse",
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
          name: "RefreshApiToken",
          input_type: ".auth._RefreshApiTokenRequest",
          output_type: ".auth._RefreshApiTokenResponse",
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

  rpc :Login, Auth.LoginRequest, stream(Auth.LoginResponse)

  rpc :GenerateApiToken, Auth.GenerateApiTokenRequest, Auth.GenerateApiTokenResponse

  rpc :RefreshApiToken, Auth.RefreshApiTokenRequest, Auth.RefreshApiTokenResponse
end

defmodule Auth.Auth.Stub do
  @moduledoc false

  use GRPC.Stub, service: Auth.Auth.Service
end