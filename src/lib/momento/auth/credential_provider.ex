defmodule Momento.Auth.CredentialProvider do
  require Joken
  alias Momento.Auth.CredentialProvider

  @moduledoc """
  Handles decoding and managing Momento authentication credentials.
  """

  @enforce_keys [
    :control_endpoint,
    :cache_endpoint,
    :auth_token
  ]
  defstruct [
    :control_endpoint,
    :cache_endpoint,
    :auth_token
  ]

  @opaque t :: %__MODULE__{
            control_endpoint: String.t(),
            cache_endpoint: String.t(),
            auth_token: String.t()
          }

  defimpl Inspect, for: CredentialProvider do
    def inspect(%CredentialProvider{} = credential_provider, _opts) do
      "#CredentialProvider<control_endpoint: #{credential_provider.control_endpoint}, control_endpoint: #{credential_provider.cache_endpoint}, auth_token: [hidden]>"
    end
  end

  @doc """
  Fetches the Momento service endpoint and global api key stored in the given
  environment variable in order to construct a credential provider.

  Returns the credential provider or raises an exception.

  ## Examples

      iex> Momento.Auth.CredentialProvider.global_key_from_env_var!("MOMENTO_API_KEY", "momento.endpoint.here")
      %Momento.Auth.CredentialProvider{}

  """
  @spec global_key_from_env_var!(
          env_var :: String.t(),
          endpoint :: String.t()
        ) :: t()
  def global_key_from_env_var!(env_var, endpoint)

  def global_key_from_env_var!(nil, _endpoint),
    do: raise(ArgumentError, "Environment variable name cannot be nil")

  def global_key_from_env_var!(_env_var, nil),
    do: raise(ArgumentError, "Endpoint cannot be nil")

  def global_key_from_env_var!(env_var, endpoint) do
    if endpoint == "" do
      raise(ArgumentError, "Endpoint cannot be empty")
    end

    if env_var == "" do
      raise(ArgumentError, "Environment variable name cannot be empty")
    end

    case System.get_env(env_var) do
      nil ->
        raise "#{env_var} is not set"

      token ->
        if token == "" do
          raise(ArgumentError, "Auth token cannot be empty")
        end

        if is_base64(token) == {:ok, true} do
          raise(
            ArgumentError,
            "Did not expect global API key to be base64 encoded. Are you using the correct key? Or did you mean to use `from_env_var!()` instead?"
          )
        end

        case is_global_api_key(token) do
          {:ok, true} ->
            :ok

          _ ->
            raise(
              ArgumentError,
              "Provided API key is not a global API key. Are you using the correct key? Or did you mean to use `from_env_var!()` instead?"
            )
        end

        global_key_from_string!(token, endpoint)
    end
  end

  @doc """
  Constructs a credential provider from the given global api key and endpoint.

  Returns the credential or raises an exception.

  ## Examples

      iex> valid_token = "valid_token" # This should be a valid Momento global api key.
      iex> Momento.Auth.CredentialProvider.global_key_from_string!(valid_token, "momento.endpoint.here")
      %Momento.Auth.CredentialProvider{}

  """
  @spec global_key_from_string!(String.t(), String.t()) :: t()
  def global_key_from_string!(token, endpoint)

  def global_key_from_string!(nil, _endpoint),
    do: raise(ArgumentError, "Auth token cannot be nil")

  def global_key_from_string!(_token, nil), do: raise(ArgumentError, "Endpoint cannot be nil")

  def global_key_from_string!(token, endpoint) do
    if endpoint == "" do
      raise(ArgumentError, "Endpoint cannot be empty")
    end

    if token == "" do
      raise(ArgumentError, "Auth token cannot be empty")
    end

    if is_base64(token) == {:ok, true} do
      raise(
        ArgumentError,
        "Did not expect global API key to be base64 encoded. Are you using the correct key? Or did you mean to use `from_string!()` instead?"
      )
    end

    case is_global_api_key(token) do
      {:ok, true} ->
        :ok

      _ ->
        raise(
          ArgumentError,
          "Provided API key is not a global API key. Are you using the correct key? Or did you mean to use `from_string!()` instead?"
        )
    end

    %Momento.Auth.CredentialProvider{
      control_endpoint: "control." <> endpoint,
      cache_endpoint: "cache." <> endpoint,
      auth_token: token
    }
  end

  @doc """
  Fetches the given environment variable and parses it into a credential.

  Returns the credential or raises an exception.

  Supply control_endpoint or cache_endpoint in the options to override them.

  ## Examples

      iex> Momento.Auth.CredentialProvider.from_env_var!("MOMENTO_AUTH_TOKEN")
      %Momento.Auth.CredentialProvider{}

  """
  @spec from_env_var!(
          env_var :: String.t(),
          opts :: [control_endpoint: String.t(), cache_endpoint: String.t()]
        ) :: t()
  def from_env_var!(env_var, opts \\ [])

  def from_env_var!(nil, _opts),
    do: raise(ArgumentError, "Environment variable name cannot be nil")

  def from_env_var!(env_var, opts) do
    case System.get_env(env_var) do
      nil -> raise "#{env_var} is not set"
      token -> from_string!(token, opts)
    end
  end

  @doc """
  Parses the given string into a credential.

  Returns the credential or raises an exception.

  Supply control_endpoint or cache_endpoint in the options to override them.

  ## Examples

      iex> valid_token = "valid_token" # This should be a valid Momento auth token.
      iex> Momento.Auth.Credential.from_string!(valid_token)
      %Momento.Auth.Credential{}

  """
  @spec from_string!(String.t(), keyword()) :: t()
  def from_string!(token, opts \\ [])
  def from_string!(nil, _opts), do: raise(ArgumentError, "Auth token cannot be nil")

  def from_string!(token, opts) do
    if is_global_api_key(token) == {:ok, true} do
      raise(
        ArgumentError,
        "Received a global API key. Are you using the correct key? Or did you mean to use `global_key_from_string!()` or `global_key_from_env_var!()` instead?"
      )
    end

    case decode_v1_token(token) do
      {:error, v1_error} ->
        if String.contains?(v1_error, "base64") do
          case decode_legacy_token(token) do
            {:error, legacy_error} ->
              raise "Failed to decode auth token: " <> legacy_error

            {:ok, result} ->
              override_endpoints(result, opts)
          end
        else
          raise "Failed to decode auth token: " <> v1_error
        end

      {:ok, result} ->
        override_endpoints(result, opts)
    end
  end

  @spec auth_token(credential_provider :: CredentialProvider.t()) :: String.t()
  def auth_token(%__MODULE__{} = credential_provider) do
    credential_provider.auth_token
  end

  @spec control_endpoint(credential_provider :: CredentialProvider.t()) :: String.t()
  def control_endpoint(%__MODULE__{} = credential_provider) do
    credential_provider.control_endpoint
  end

  @spec cache_endpoint(credential_provider :: CredentialProvider.t()) :: String.t()
  def cache_endpoint(%__MODULE__{} = credential_provider) do
    credential_provider.cache_endpoint
  end

  @spec override_endpoints(credential_provider :: t(), opts :: keyword()) :: t()
  defp override_endpoints(credential_provider, opts) do
    %{
      credential_provider
      | control_endpoint:
          Keyword.get(opts, :control_endpoint) || credential_provider.control_endpoint,
        cache_endpoint: Keyword.get(opts, :cache_endpoint) || credential_provider.cache_endpoint
    }
  end

  @spec is_base64(String.t()) :: {:ok, bool} | {:error, String.t()}
  defp is_base64(base64_string) do
    case Base.decode64(base64_string) do
      {:ok, decoded} ->
        {:ok, String.length(decoded) > 0}

      _ ->
        {:error, "Failed to decode base64 string"}
    end
  end

  @spec is_global_api_key(String.t()) :: {:ok, bool} | {:error, String.t()}
  defp is_global_api_key(api_key) do
    with {:ok, claims} <- decode_jwt(api_key),
         {:ok, key_type} <- get_claim(claims, "t") do
      {:ok, key_type == "g"}
    else
      error -> error
    end
  end

  @spec decode_v1_token(String.t()) :: {:ok, t()} | {:error, String.t()}
  defp decode_v1_token(v1_token) do
    with {:ok, json} <- decode_base64_to_json(v1_token),
         {:ok, endpoint} <- fetch_value_from_json(json, "endpoint"),
         {:ok, api_key} <- fetch_value_from_json(json, "api_key"),
         {control_endpoint, cache_endpoint} <- distinguish_endpoints(endpoint) do
      {:ok,
       %Momento.Auth.CredentialProvider{
         control_endpoint: control_endpoint,
         cache_endpoint: cache_endpoint,
         auth_token: api_key
       }}
    else
      error -> error
    end
  end

  @spec decode_base64_to_json(String.t()) :: {:ok, map()} | {:error, String.t()}
  defp decode_base64_to_json(base64_string) do
    case Base.decode64(base64_string) do
      {:ok, decoded} ->
        case Jason.decode(decoded) do
          {:ok, json} -> {:ok, json}
          _ -> {:error, "Failed to parse JSON"}
        end

      _ ->
        {:error, "Failed to decode base64 string"}
    end
  end

  @spec fetch_value_from_json(map(), String.t()) :: {:ok, String.t()} | {:error, String.t()}
  defp fetch_value_from_json(json, key) do
    case Map.get(json, key) do
      nil -> {:error, "#{key} not found in JSON"}
      value -> {:ok, value}
    end
  end

  @spec distinguish_endpoints(String.t()) :: {String.t(), String.t()}
  defp distinguish_endpoints(hostname) do
    {"control." <> hostname, "cache." <> hostname}
  end

  @spec decode_legacy_token(String.t()) :: {:ok, t()} | {:error, String.t()}
  defp decode_legacy_token(token) do
    with {:ok, claims} <- decode_jwt(token),
         {:ok, control_endpoint} <- get_claim(claims, "cp"),
         {:ok, cache_endpoint} <- get_claim(claims, "c") do
      {:ok,
       %Momento.Auth.CredentialProvider{
         control_endpoint: control_endpoint,
         cache_endpoint: cache_endpoint,
         auth_token: token
       }}
    else
      error -> error
    end
  end

  @spec decode_jwt(String.t()) :: {:ok, map()} | {:error, String.t()}
  defp decode_jwt(token) do
    case Joken.peek_claims(token) do
      {:ok, claims} ->
        {:ok, claims}

      _ ->
        {:error, "Invalid JWT"}
    end
  end

  @spec get_claim(map(), String.t()) :: {:ok, String.t()} | {:error, String.t()}
  defp get_claim(claims, claim_key) do
    case Map.get(claims, claim_key) do
      nil ->
        {:error, "#{claim_key} not found in JWT claims"}

      claim_value ->
        {:ok, claim_value}
    end
  end
end
