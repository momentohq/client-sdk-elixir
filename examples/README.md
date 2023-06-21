# Elixir SDK Examples

## Running the Examples

Build and compile the examples with:
```bash
mix deps.get
mix compile
```

### Basic
The basic example shows how to get and set individual items in a Momento cache.
```bash
MOMENTO_AUTH_TOKEN=<YOUR AUTH TOKEN> mix run basic.exs
```
Example Code: [basic.exs](basic.exs)

### Sorted Set
The sorted set example shows how to use the various sorted set methods.
```bash
MOMENTO_AUTH_TOKEN=<YOUR AUTH TOKEN> mix run sorted_set.exs
```
Example Code: [sorted_set.exs](sorted_set.exs)

