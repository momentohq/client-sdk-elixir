defmodule Momento.Auth.CredentialProvider do
  require Joken

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

  @doc """
  Fetches the given environment variable and parses it into a credential.

  Returns the credential or raises an exception.

  Supply control_endpoint or cache_endpoint in the options to override them.

  ## Examples

      iex> Momento.Auth.Credential.from_env_var!("MOMENTO_AUTH_TOKEN")
      %Momento.Auth.Credential{}

  """
  @spec from_env_var!(String.t(), keyword()) :: t()
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
    case decode_v1_token(token) do
      {:error, _} ->
        case decode_legacy_token(token) do
          {:error, _} -> raise "Failed to decode auth token"
          {:ok, result} -> override_endpoints(result, opts)
        end

      {:ok, result} ->
        override_endpoints(result, opts)
    end
  end

  @doc """
  Returns a new credential with its control_endpoint replaced by the given one.

  Returns the original credential if the new endpoint is nil.
  """
  @spec replace_control_endpoint(t(), String.t()) :: t()
  def replace_control_endpoint(%Momento.Auth.CredentialProvider{} = credential, nil),
    do: credential

  def replace_control_endpoint(
        %Momento.Auth.CredentialProvider{} = credential,
        new_control_endpoint
      ) do
    %{credential | control_endpoint: new_control_endpoint}
  end

  @doc """
  Returns a new credential with its cache_endpoint replaced by the given one.

  Returns the original credential if the new endpoint is nil.
  """
  @spec replace_cache_endpoint(t(), String.t()) :: t()
  def replace_cache_endpoint(%Momento.Auth.CredentialProvider{} = credential, nil), do: credential

  def replace_cache_endpoint(%Momento.Auth.CredentialProvider{} = credential, new_cache_endpoint) do
    %{credential | cache_endpoint: new_cache_endpoint}
  end

  @spec override_endpoints(t(), keyword()) :: t()
  defp override_endpoints(credentialProvider, opts) do
    credentialProvider
    |> replace_control_endpoint(Keyword.get(opts, :control_endpoint))
    |> replace_cache_endpoint(Keyword.get(opts, :cache_endpoint))
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
    try do
      {:ok, Base.decode64!(base64_string) |> Jason.decode!()}
    rescue
      _ -> {:error, "Failed to decode base64 string or parse JSON"}
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
