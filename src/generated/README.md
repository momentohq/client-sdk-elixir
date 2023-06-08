# Generated gRPC Files

These files were generated from [Momento Client Protos](https://github.com/momentohq/client-protos). They will be moved 
into that project in the future.

They were made using the protoc tool and [protobuf-elixir](https://github.com/elixir-protobuf/protobuf).

### Prerequisites

- Elixir

- A local copy of [client-protos](https://github.com/momentohq/client-protos)

- `protoc`. Mac users can install it with:
```commandline
brew install protobuf
```

- The escripts needed for code generation. Install them with:
```commandline
mix escript.install hex protobuf
```

- `~/.mix/escripts` is added to your PATH

### Generation
The protoc command requires the full path to the proto directory of client-protos.

From the `src` directory:

```commandline
protoc --elixir_out=gen_descriptors=true,plugins=grpc:./generated/ --proto_path /path/to/client-protos/proto auth.proto
protoc --elixir_out=gen_descriptors=true,plugins=grpc:./generated/ --proto_path /path/to/client-protos/proto cacheclient.proto
protoc --elixir_out=gen_descriptors=true,plugins=grpc:./generated/ --proto_path /path/to/client-protos/proto cacheping.proto
protoc --elixir_out=gen_descriptors=true,plugins=grpc:./generated/ --proto_path /path/to/client-protos/proto cachepubsub.proto
protoc --elixir_out=gen_descriptors=true,plugins=grpc:./generated/ --proto_path /path/to/client-protos/proto controlclient.proto
protoc --elixir_out=gen_descriptors=true,plugins=grpc:./generated/ --proto_path /path/to/client-protos/proto extensions.proto
protoc --elixir_out=gen_descriptors=true,plugins=grpc:./generated/ --proto_path /path/to/client-protos/proto httpcache.proto

protoc --elixir_out=gen_descriptors=true,plugins=grpc:./generated/ --proto_path /path/to/client-protos/proto google/api/annotations.proto
protoc --elixir_out=gen_descriptors=true,plugins=grpc:./generated/ --proto_path /path/to/client-protos/proto google/api/http.proto
protoc --elixir_out=gen_descriptors=true,plugins=grpc:./generated/ --proto_path /path/to/client-protos/proto google/api/httpbody.proto
protoc --elixir_out=gen_descriptors=true,plugins=grpc:./generated/ --proto_path /path/to/client-protos/proto google/api/pb_extension.proto
```
