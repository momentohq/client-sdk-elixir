<head>
  <meta name="Momento Elixir Client Library Documentation" content="Elixir client software development kit for Momento Cache">
</head>
<img src="https://docs.momentohq.com/img/momento-logo-forest.svg" alt="logo" width="400"/>

[![project status](https://momentohq.github.io/standards-and-practices/badges/project-status-official.svg)](https://github.com/momentohq/standards-and-practices/blob/main/docs/momento-on-github.md)
[![project stability](https://momentohq.github.io/standards-and-practices/badges/project-stability-beta.svg)](https://github.com/momentohq/standards-and-practices/blob/main/docs/momento-on-github.md)

# Momento Elixir Client Library

Momento Cache is a fast, simple, pay-as-you-go caching solution without any of the operational overhead
required by traditional caching solutions.  This repo contains the source code for the Momento Elixir client library.

To get started with Momento you will need a Momento Auth Token. You can get one from the [Momento Console](https://console.gomomento.com).

* Website: [https://www.gomomento.com/](https://www.gomomento.com/)
* Momento Documentation: [https://docs.momentohq.com/](https://docs.momentohq.com/)
* Getting Started: [https://docs.momentohq.com/getting-started](https://docs.momentohq.com/getting-started)
* Elixir SDK Documentation: [https://docs.momentohq.com/develop/sdks/elixir](https://docs.momentohq.com/develop/sdks/elixir)
* Discuss: [Momento Discord](https://discord.gg/3HkAKjUZGq)

## Packages

The Momento Elixir SDK is available on [Hex](https://hex.pm/packages/gomomento).

## Usage

```elixir
alias Momento.CacheClient

config = Momento.Configurations.Laptop.latest()
credential_provider = Momento.Auth.CredentialProvider.from_env_var!("MOMENTO_AUTH_TOKEN")
default_ttl_seconds = 60.0
client = CacheClient.create!(config, credential_provider, default_ttl_seconds)

cache_name = "cache"

case CacheClient.create_cache(client, cache_name) do
  {:ok, _} -> :ok
  :already_exists -> :ok
  {:error, error} -> raise error
end

{:ok, _} = CacheClient.set(client, cache_name, "foo", "bar")

case CacheClient.get(client, cache_name, "foo") do
  {:ok, hit} -> IO.puts("Got value: #{hit.value}")
  :miss -> :ok
  {:error, error} -> raise error
end

```

## Getting Started and Documentation

Documentation is available on the [Momento Docs website](https://docs.momentohq.com).

## Examples

Working example projects, with all required build configuration files, are available in the [examples](./examples) subdirectory.

## Developing

If you are interested in contributing to the SDK, please see the [CONTRIBUTING](./CONTRIBUTING.md) docs.

----------------------------------------------------------------------------------------
For more info, visit our website at [https://gomomento.com](https://gomomento.com)!
