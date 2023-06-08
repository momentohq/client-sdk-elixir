defmodule Momento.Auth.CredentialProvider do
  @moduledoc """
  Provides information that the CacheClient needs in order to establish a connection to and authenticate with
  the Momento service.
  """
  @enforce_keys [:auth_token, :control_endpoint, :cache_endpoint]
  defstruct [:auth_token, :control_endpoint, :cache_endpoint]

  @type t() :: %__MODULE__{
          auth_token: String.t(),
          control_endpoint: String.t(),
          cache_endpoint: String.t()
        }

  @spec from_string!(auth_token :: String.t()) :: Momento.Auth.CredentialProvider.t()
  def from_string!(auth_token) do
    from_string!(auth_token, nil, nil)
  end

  @spec from_string!(
          auth_token :: String.t(),
          control_endpoint :: String.t() | nil,
          cache_endpoint :: String.t() | nil
        ) :: Momento.Auth.CredentialProvider.t()
  def from_string!(auth_token, control_endpoint, cache_endpoint) do
    decoded = decode_auth_token(auth_token)

    final_control_endpoint = control_endpoint || decoded.control_endpoint

    if final_control_endpoint == nil do
      raise ArgumentError,
            "Malformed token; unable to determine control endpoint.  Depending on the type of token you are using, you may need to specify the controlEndpoint explicitly."
    end

    final_cache_endpoint = cache_endpoint || decoded.cache_endpoint

    if final_cache_endpoint == nil do
      raise ArgumentError,
            "Malformed token; unable to determine cache endpoint.  Depending on the type of token you are using, you may need to specify the cacheEndpoint explicitly."
    end

    %Momento.Auth.CredentialProvider{
      auth_token: decoded.auth_token,
      control_endpoint: final_control_endpoint,
      cache_endpoint: final_cache_endpoint
    }
  end

  @spec decode_auth_token(auth_token :: String.t()) :: %{
          required(:auth_token) => String.t(),
          required(:control_endpoint) => String.t() | nil,
          required(:cache_endpoint) => String.t() | nil
        }
  defp decode_auth_token(auth_token) do
    # v1 api tokens don't have an endpoint as part of their claims. Instead, when the SDK returns tokens, we
    # give it to them as a base64 encoded string of '{ "api_key": "<the key>", "endpoint": "prod.momentohq.com" }'.
    # Since in the near future, most customers are going to be using these newer tokens, we are first checking to see if
    # they are base64 encoded, which will tell us that they are our v1 api tokens. If its not, we will fall back to decoding
    # it as one of our legacy jwts.
    base64_decode_result = Base.decode64(auth_token)

    case base64_decode_result do
      {:ok, base64_decoded} ->
        json_decoded = Jason.decode!(base64_decoded)
        %{
          auth_token: json_decoded,
          control_endpoint: nil,
          cache_endpoint: nil
        }

      _ ->
        raise RuntimeError, "Not yet implemented!"
    end
  end

  @spec is_base_64(auth_token :: String.t()) :: boolean()
  defp is_base_64(auth_token) do
    false
  end
end
