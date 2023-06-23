## Development

1. Install Elixir
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

