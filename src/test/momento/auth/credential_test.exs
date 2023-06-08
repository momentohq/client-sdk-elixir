defmodule Momento.Auth.CredentialTest do
  use ExUnit.Case

  alias Momento.Auth.Credential

  @control_endpoint "control.test.momentohq.com"
  @cache_endpoint "cache.test.momentohq.com"

  @valid_v1_token "eyJhcGlfa2V5IjogInRlc3RfYXBpX2tleSIsICJlbmRwb2ludCI6ICJ0ZXN0Lm1vbWVudG9ocS5jb20ifQ=="

  @valid_v1_api_key "test_api_key"

  @valid_legacy_token "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzcXVpcnJlbCIsImNwIjoiY29udHJvbC50ZXN0Lm1vbWVudG9ocS5jb20iLCJjIjoiY2FjaGUudGVzdC5tb21lbnRvaHEuY29tIn0.TI810tD5soVw8yVHU4WhCy87UrMorVwIQ7CxFo-dSRQo5_gJVUTIfxGN624BjqbrqpIwGY8maoj96FQlp2NALA"

  @invalid_token "INVALID_TOKEN"

  test "parse_credential/1 with valid v1 token returns expected value" do
    assert Credential.parse_credential(@valid_v1_token) ==
             %Momento.Auth.Credential{
               control_endpoint: @control_endpoint,
               cache_endpoint: @cache_endpoint,
               auth_token: @valid_v1_api_key
             }
  end

  test "parse_credential/1 with valid legacy token returns expected value" do
    assert Credential.parse_credential(@valid_legacy_token) ==
             %Momento.Auth.Credential{
               control_endpoint: @control_endpoint,
               cache_endpoint: @cache_endpoint,
               auth_token: @valid_legacy_token
             }
  end

  test "parse_credential/1 with invalid token returns error tuple" do
    assert_raise RuntimeError, "Failed to decode auth token", fn ->
      Credential.parse_credential(@invalid_token)
    end
  end
end
