defmodule Momento.Auth.CredentialProviderTest do
  use ExUnit.Case

  alias Momento.Auth.CredentialProvider

  @control_endpoint "control.test.momentohq.com"
  @cache_endpoint "cache.test.momentohq.com"

  @control_endpoint_override "control.example.com"
  @cache_endpoint_override "cache.example.com"

  # Not a live token. The decoded value is:
  # {"api_key": "test_api_key", "endpoint": "test.momentohq.com"}
  @v1_valid_token "eyJhcGlfa2V5IjogInRlc3RfYXBpX2tleSIsICJlbmRwb2ludCI6ICJ0ZXN0Lm1vbWVudG9ocS5jb20ifQ=="

  @v1_api_key "test_api_key"

  # Not a live token. The decoded value is:
  # {"api_key": "test_api_key"}
  @v1_missing_endpoint "eyJhcGlfa2V5IjogInRlc3RfYXBpX2tleSJ9"

  # Not a live token. The decoded value is:
  # {"endpoint": "test.momentohq.com"}
  @v1_missing_api_key "eyJlbmRwb2ludCI6ICJ0ZXN0Lm1vbWVudG9ocS5jb20ifQ=="

  # Not a live token. The payload is:
  # {"sub": "squirrel", "cp": "control.test.momentohq.com", "c": "cache.test.momentohq.com"}
  @legacy_valid_token "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzcXVpcnJlbCIsImNwIjoiY29udHJvbC50ZXN0Lm1vbWVudG9ocS5jb20iLCJjIjoiY2FjaGUudGVzdC5tb21lbnRvaHEuY29tIn0.TI810tD5soVw8yVHU4WhCy87UrMorVwIQ7CxFo-dSRQo5_gJVUTIfxGN624BjqbrqpIwGY8maoj96FQlp2NALA"

  # Not a live token. The payload is:
  # {"sub": "squirrel", "c": "cache.test.momentohq.com"}
  @legacy_missing_control "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzcXVpcnJlbCIsImMiOiJjYWNoZS50ZXN0Lm1vbWVudG9ocS5jb20ifQ.-kuke50ET8VCOEEAxF5NDy4A3BHCenct4T4friGlbRFZVGTcMesLxcdH4tgy3pSNqnkvb4aY09EDX4B-x0AZ9Q"

  # Not a live token. The payload is:
  # {"sub": "squirrel", "cp": "control.test.momentohq.com"}
  @legacy_missing_cache "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzcXVpcnJlbCIsImNwIjoiY29udHJvbC50ZXN0Lm1vbWVudG9ocS5jb20ifQ.hZoP3LbpZBeOHQPGgKaRsvw-pjzohrzO_g84S5kxANG6d5zSHeJBeOGPyst6YcoYk174EBP9zg5APbE4w7VH-A"

  @invalid_token "INVALID_TOKEN"

  @test_v2_api_key "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ0IjoiZyIsImp0aSI6InNvbWUtaWQifQ.GMr9nA6HE0ttB6llXct_2Sg5-fOKGFbJCdACZFgNbN1fhT6OPg_hVc8ThGzBrWC_RlsBpLA1nzqK3SOJDXYxAw"
  @test_endpoint "testEndpoint"
  @api_key_env_var "MOMENTO_API_KEY"
  @endpoint_env_var "MOMENTO_ENDPOINT"

  test "from_string!/2 with valid v1 token returns expected value" do
    assert CredentialProvider.from_string!(@v1_valid_token) ==
             %Momento.Auth.CredentialProvider{
               control_endpoint: @control_endpoint,
               cache_endpoint: @cache_endpoint,
               auth_token: @v1_api_key
             }
  end

  test "from_string!/2 with valid v1 token and control override returns expected value" do
    assert CredentialProvider.from_string!(@v1_valid_token,
             control_endpoint: @control_endpoint_override
           ) ==
             %Momento.Auth.CredentialProvider{
               control_endpoint: @control_endpoint_override,
               cache_endpoint: @cache_endpoint,
               auth_token: @v1_api_key
             }
  end

  test "from_string!/2 with valid v1 token and cache override returns expected value" do
    assert CredentialProvider.from_string!(@v1_valid_token,
             cache_endpoint: @cache_endpoint_override
           ) ==
             %Momento.Auth.CredentialProvider{
               control_endpoint: @control_endpoint,
               cache_endpoint: @cache_endpoint_override,
               auth_token: @v1_api_key
             }
  end

  test "from_string!/2 with valid v1 token and both endpoints overridden returns expected value" do
    assert CredentialProvider.from_string!(@v1_valid_token,
             control_endpoint: @control_endpoint_override,
             cache_endpoint: @cache_endpoint_override
           ) ==
             %Momento.Auth.CredentialProvider{
               control_endpoint: @control_endpoint_override,
               cache_endpoint: @cache_endpoint_override,
               auth_token: @v1_api_key
             }
  end

  test "from_string!/2 with valid legacy token returns expected value" do
    assert CredentialProvider.from_string!(@legacy_valid_token) ==
             %Momento.Auth.CredentialProvider{
               control_endpoint: @control_endpoint,
               cache_endpoint: @cache_endpoint,
               auth_token: @legacy_valid_token
             }
  end

  test "from_string!/2 with valid legacy token and control override returns expected value" do
    assert CredentialProvider.from_string!(@legacy_valid_token,
             control_endpoint: @control_endpoint_override
           ) ==
             %Momento.Auth.CredentialProvider{
               control_endpoint: @control_endpoint_override,
               cache_endpoint: @cache_endpoint,
               auth_token: @legacy_valid_token
             }
  end

  test "from_string!/2 with valid legacy token and cache override returns expected value" do
    assert CredentialProvider.from_string!(@legacy_valid_token,
             cache_endpoint: @cache_endpoint_override
           ) ==
             %Momento.Auth.CredentialProvider{
               control_endpoint: @control_endpoint,
               cache_endpoint: @cache_endpoint_override,
               auth_token: @legacy_valid_token
             }
  end

  test "from_string!/2 with valid legacy token and both endpoints overridden returns expected value" do
    assert CredentialProvider.from_string!(@v1_valid_token,
             control_endpoint: @control_endpoint_override,
             cache_endpoint: @cache_endpoint_override
           ) ==
             %Momento.Auth.CredentialProvider{
               control_endpoint: @control_endpoint_override,
               cache_endpoint: @cache_endpoint_override,
               auth_token: @v1_api_key
             }
  end

  test "from_env_var!/2 with nil environment variable raises an exception" do
    assert_raise ArgumentError, "Environment variable name cannot be nil", fn ->
      CredentialProvider.from_env_var!(nil)
    end
  end

  test "from_string!/2 with invalid token raises an exception" do
    assert_raise RuntimeError, ~r/Invalid JWT/, fn ->
      CredentialProvider.from_string!(@invalid_token)
    end
  end

  test "from_string!/2 with nil token raises an exception" do
    assert_raise ArgumentError, "Auth token cannot be nil", fn ->
      CredentialProvider.from_string!(nil)
    end
  end

  test "from_string!/2 with v1 token that is missing an endpoint raises an exception" do
    assert_raise RuntimeError, ~r/endpoint not found in JSON/, fn ->
      CredentialProvider.from_string!(@v1_missing_endpoint)
    end
  end

  test "from_string!/2 with v1 token that is missing an api key raises an exception" do
    assert_raise RuntimeError, ~r/api_key not found in JSON/, fn ->
      CredentialProvider.from_string!(@v1_missing_api_key)
    end
  end

  test "from_string!/2 with legacy token that is missing a control endpoint raises an exception" do
    assert_raise RuntimeError, ~r/cp not found/, fn ->
      CredentialProvider.from_string!(@legacy_missing_control)
    end
  end

  test "from_string!/2 with legacy token that is missing a cache endpoint raises an exception" do
    assert_raise RuntimeError, ~r/c not found/, fn ->
      CredentialProvider.from_string!(@legacy_missing_cache)
    end
  end

  test "from_string!/2 with v2 api key raises an exception" do
    assert_raise ArgumentError, ~r/Received a v2 API key/, fn ->
      CredentialProvider.from_string!(@test_v2_api_key)
    end
  end

  test "from_env_var!/2 with v2 api key raises an exception" do
    System.put_env(@api_key_env_var, @test_v2_api_key)

    assert_raise ArgumentError, ~r/Received a v2 API key/, fn ->
      CredentialProvider.from_env_var!(@api_key_env_var)
    end

    System.delete_env(@api_key_env_var)
  end

  test "from_api_key_v2!/2 happy path" do
    assert CredentialProvider.from_api_key_v2!(@test_v2_api_key, @test_endpoint) ==
             %Momento.Auth.CredentialProvider{
               control_endpoint: "control." <> @test_endpoint,
               cache_endpoint: "cache." <> @test_endpoint,
               auth_token: @test_v2_api_key
             }
  end

  test "from_api_key_v2!/2 with nil token raises an exception" do
    assert_raise ArgumentError, "API key cannot be nil", fn ->
      CredentialProvider.from_api_key_v2!(nil, @test_endpoint)
    end
  end

  test "from_api_key_v2!/2 with nil endpoint raises an exception" do
    assert_raise ArgumentError, "Endpoint cannot be nil", fn ->
      CredentialProvider.from_api_key_v2!(@test_v2_api_key, nil)
    end
  end

  test "from_api_key_v2!/2 with empty string token raises an exception" do
    assert_raise ArgumentError, "API key cannot be empty", fn ->
      CredentialProvider.from_api_key_v2!("", @test_endpoint)
    end
  end

  test "from_api_key_v2!/2 with empty string endpoint raises an exception" do
    assert_raise ArgumentError, "Endpoint cannot be empty", fn ->
      CredentialProvider.from_api_key_v2!(@test_v2_api_key, "")
    end
  end

  test "from_api_key_v2!/2 with v1 api key raises an exception" do
    assert_raise ArgumentError,
                 "Received an invalid v2 API key. Are you using the correct key? Or did you mean to use `from_string!()` with a legacy key instead?",
                 fn ->
                   CredentialProvider.from_api_key_v2!(@v1_valid_token, @test_endpoint)
                 end
  end

  test "from_api_key_v2!/2 with pre-v1 api key raises an exception" do
    assert_raise ArgumentError,
                 "Received an invalid v2 API key. Are you using the correct key? Or did you mean to use `from_string!()` with a legacy key instead?",
                 fn ->
                   CredentialProvider.from_api_key_v2!(@legacy_valid_token, @test_endpoint)
                 end
  end

  test "from_env_var_v2!/2 happy path" do
    System.put_env(@api_key_env_var, @test_v2_api_key)
    System.put_env(@endpoint_env_var, @test_endpoint)

    assert CredentialProvider.from_env_var_v2!(@api_key_env_var, @endpoint_env_var) ==
             %Momento.Auth.CredentialProvider{
               control_endpoint: "control." <> @test_endpoint,
               cache_endpoint: "cache." <> @test_endpoint,
               auth_token: @test_v2_api_key
             }

    System.delete_env(@api_key_env_var)
    System.delete_env(@endpoint_env_var)
  end

  test "from_env_var_v2!/2 with unset api key env var raises an exception" do
    System.delete_env(@api_key_env_var)
    System.put_env(@endpoint_env_var, @test_endpoint)

    assert_raise RuntimeError, "#{@api_key_env_var} is not set", fn ->
      CredentialProvider.from_env_var_v2!(@api_key_env_var, @endpoint_env_var)
    end

    System.delete_env(@endpoint_env_var)
  end

  test "from_env_var_v2!/2 with unset endpoint env var raises an exception" do
    System.delete_env(@endpoint_env_var)
    System.put_env(@api_key_env_var, @test_v2_api_key)

    assert_raise RuntimeError, "#{@endpoint_env_var} is not set", fn ->
      CredentialProvider.from_env_var_v2!(@api_key_env_var, @endpoint_env_var)
    end

    System.delete_env(@api_key_env_var)
  end

  test "from_env_var_v2!/2 with omitted env var names uses defaults" do
    System.put_env(@endpoint_env_var, @test_endpoint)
    System.put_env(@api_key_env_var, @test_v2_api_key)

    assert CredentialProvider.from_env_var_v2!() ==
             %Momento.Auth.CredentialProvider{
               control_endpoint: "control." <> @test_endpoint,
               cache_endpoint: "cache." <> @test_endpoint,
               auth_token: @test_v2_api_key
             }

    System.delete_env(@endpoint_env_var)
    System.delete_env(@api_key_env_var)
  end

  test "from_env_var_v2!/2 with nil env var names uses defaults" do
    System.put_env(@endpoint_env_var, @test_endpoint)
    System.put_env(@api_key_env_var, @test_v2_api_key)

    assert CredentialProvider.from_env_var_v2!(nil, nil) ==
             %Momento.Auth.CredentialProvider{
               control_endpoint: "control." <> @test_endpoint,
               cache_endpoint: "cache." <> @test_endpoint,
               auth_token: @test_v2_api_key
             }

    System.delete_env(@endpoint_env_var)
    System.delete_env(@api_key_env_var)
  end

  test "from_env_var_v2!/2 with empty string api key env var raises an exception" do
    System.put_env(@endpoint_env_var, @test_endpoint)

    assert_raise ArgumentError, "API key environment variable name cannot be empty", fn ->
      CredentialProvider.from_env_var_v2!("", @endpoint_env_var)
    end

    System.delete_env(@endpoint_env_var)
  end

  test "from_env_var_v2!/2 with empty string endpoint env var raises an exception" do
    System.put_env(@api_key_env_var, @test_v2_api_key)

    assert_raise ArgumentError, "Endpoint environment variable name cannot be empty", fn ->
      CredentialProvider.from_env_var_v2!(@api_key_env_var, "")
    end

    System.delete_env(@api_key_env_var)
  end

  test "from_env_var_v2!/2 with empty string in api key env var raises an exception" do
    System.put_env(@api_key_env_var, "")
    System.put_env(@endpoint_env_var, @test_endpoint)

    assert_raise ArgumentError, "API key cannot be empty", fn ->
      CredentialProvider.from_env_var_v2!(@api_key_env_var, @endpoint_env_var)
    end

    System.delete_env(@api_key_env_var)
    System.delete_env(@endpoint_env_var)
  end

  test "from_env_var_v2!/2 with empty string in endpoint env var raises an exception" do
    System.put_env(@api_key_env_var, @test_v2_api_key)
    System.put_env(@endpoint_env_var, "")

    assert_raise ArgumentError, "Endpoint cannot be empty", fn ->
      CredentialProvider.from_env_var_v2!(@api_key_env_var, @endpoint_env_var)
    end

    System.delete_env(@api_key_env_var)
    System.delete_env(@endpoint_env_var)
  end

  test "from_env_var_v2!/2 with v1 api key in env var raises an exception" do
    System.put_env(@api_key_env_var, @v1_valid_token)
    System.put_env(@endpoint_env_var, @test_endpoint)

    assert_raise ArgumentError,
                 "Received an invalid v2 API key. Are you using the correct key? Or did you mean to use `from_env_var!()` with a legacy key instead?",
                 fn ->
                   CredentialProvider.from_env_var_v2!(@api_key_env_var, @endpoint_env_var)
                 end

    System.delete_env(@api_key_env_var)
    System.delete_env(@endpoint_env_var)
  end

  test "from_env_var_v2!/2 with pre-v1 api key in env var raises an exception" do
    System.put_env(@api_key_env_var, @legacy_valid_token)
    System.put_env(@endpoint_env_var, @test_endpoint)

    assert_raise ArgumentError,
                 "Received an invalid v2 API key. Are you using the correct key? Or did you mean to use `from_env_var!()` with a legacy key instead?",
                 fn ->
                   CredentialProvider.from_env_var_v2!(@api_key_env_var, @endpoint_env_var)
                 end

    System.delete_env(@api_key_env_var)
    System.delete_env(@endpoint_env_var)
  end

  test "from_disposable_token!/2 given v2 api key raises an exception" do
    assert_raise ArgumentError,
                 "Received a v2 API key. Are you using the correct key? Or did you mean to use `from_api_key_v2!()` or `from_env_var_v2!()` instead?",
                 fn ->
                   CredentialProvider.from_disposable_token!(@test_v2_api_key)
                 end
  end

  test "from_disposable_token!/2 given v1 api key" do
    assert CredentialProvider.from_disposable_token!(@v1_valid_token) ==
             %Momento.Auth.CredentialProvider{
               control_endpoint: @control_endpoint,
               cache_endpoint: @cache_endpoint,
               auth_token: @v1_api_key
             }
  end

  test "from_disposable_token!/2 given pre-v1 api key" do
    assert CredentialProvider.from_disposable_token!(@legacy_valid_token) ==
             %Momento.Auth.CredentialProvider{
               control_endpoint: @control_endpoint,
               cache_endpoint: @cache_endpoint,
               auth_token: @legacy_valid_token
             }
  end
end
