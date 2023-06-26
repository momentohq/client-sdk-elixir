## Development

1. Install Elixir
    The recommended way to install elixir is using [`asdf`](https://asdf-vm.com/). This allows you to manage multiple versions of elixir/erlang on your machine. To install `asdf`, see their [Getting Started](https://asdf-vm.com/guide/getting-started.html) docs, or:

```bash
brew install asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
```

Then restart your shell.

Next, install erlang and elixir via asdf:

```bash
asdf plugin add erlang
asdf install erlang 25.3.2.2
asdf global erlang 25.3.2.2
asdf plugin add elixir
asdf install elixir 1.14.5
asdf global elixir 1.14.5
```

    Alternately you may install elixir via homebrew, which is a little faster for the initial install but will prevent you from being able to easily switch between different versions of elixir/erlang. To install via homebrew: 

    * `brew install elixir`

1. Clone repo
    * `git clone git@github.com:momentohq/client-sdk-elixir.git`
1. Switch to the src directory
    * `cd src`
1. Pull down the dependencies and compile
    * `mix deps.get`
    * `mix compile`
1. To run unit tests:
    * `mix test`
1. To run integration tests:
    * Generate auth token with [momento-cli](https://github.com/momentohq/momento-cli/) (if you don't already have one)
    * `TEST_AUTH_TOKEN=<auth token> TEST_CACHE_NAME=<cache id> mix test integration-test`
        * `TEST_CACHE_NAME` is required. Give it any string value for now.
      
### Code Formatting and Type Checking

Mix has a built-in formatting tool that should be run before any commit:

`mix format`

Use dialyzer to check types before committing:

`mix dialyzer`

