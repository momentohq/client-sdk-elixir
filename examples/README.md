# Elixir SDK Examples

## Running the Examples

- To get started you will need a Momento API Key. You can get one from the
  [Momento Console](https://console.gomomento.com).
- A Momento service endpoint is required. Choose from one of the following [regions](https://docs.momentohq.com/platform/regions).

Build and compile the examples with:
```bash
mix deps.get
mix compile
```

### Basic
The basic example shows how to get and set individual items in a Momento cache.
```bash
MOMENTO_API_KEY=<your api key> MOMENTO_ENDPOINT=<your endpoint> mix run basic.exs
```
Example Code: [basic.exs](basic.exs)

### Sorted Set
The sorted set example shows how to use the various sorted set methods.
```bash
MOMENTO_API_KEY=<your api key> MOMENTO_ENDPOINT=<your endpoint> mix run sorted_set.exs
```
Example Code: [sorted_set.exs](sorted_set.exs)

