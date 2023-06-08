defmodule Momento.Auth.Credential do
  require Joken

  @moduledoc """
  Handles decoding and managing Momento authentication credentials.
  """

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

  ## Examples

      iex> Momento.Auth.Credential.parse_credential_from_env_var("MOMENTO_AUTH_TOKEN")
      %Momento.Auth.Credential{}

  """
  @spec parse_credential_from_env_var(String.t()) :: t() | no_return()
  def parse_credential_from_env_var(env_var) do
    case System.get_env(env_var) do
      nil -> raise "#{env_var} is not set"
      token -> parse_credential(token)
    end
  end

  @doc """
  Parses the given string into a credential.

  Returns the credential or raises an exception.

  ## Examples

      iex> valid_token = "valid_token" # This should be a valid Momento auth token.
      iex> Momento.Auth.Credential.parse_credential(valid_token)
      %Momento.Auth.Credential{}

  """
  @spec parse_credential(String.t()) :: t() | no_return()
  def parse_credential(token) do
    case decode_v1_token(token) do
      {:error, _} ->
        case decode_legacy_token(token) do
          {:error, _} -> raise "Failed to decode auth token"
          {:ok, result} -> result
        end

      {:ok, result} ->
        result
    end
  end

  @doc """
  Returns a new credential with its control_endpoint replaced by the given one.
  """
  @spec replace_control_endpoint(t(), String.t()) :: t()
  def replace_control_endpoint(%Momento.Auth.Credential{} = credential, new_control_endpoint) do
    %{credential | control_endpoint: new_control_endpoint}
  end

  @doc """
  Returns a new credential with its cache_endpoint replaced by the given one.
  """
  @spec replace_cache_endpoint(t(), String.t()) :: t()
  def replace_cache_endpoint(%Momento.Auth.Credential{} = credential, new_cache_endpoint) do
    %{credential | cache_endpoint: new_cache_endpoint}
  end

  @spec decode_v1_token(String.t()) :: {:ok, t()} | {:error, String.t()}
  defp decode_v1_token(v1_token) do
    with {:ok, json} <- decode_base64_to_json(v1_token),
         {:ok, endpoint} <- fetch_value_from_json(json, "endpoint"),
         {:ok, api_key} <- fetch_value_from_json(json, "api_key"),
         {:ok, {control_endpoint, cache_endpoint}} <- distinguish_endpoints(endpoint) do
      form_credential(control_endpoint, cache_endpoint, api_key)
    else
      error -> error
    end
  end

  @spec decode_base64_to_json(String.t()) :: map()
  defp decode_base64_to_json(base64_string) do
    try do
      {:ok, Base.decode64!(base64_string) |> Jason.decode!()}
    rescue
      _ -> {:error, "Failed to decode base64 string or parse JSON"}
    end
  end

  @spec fetch_value_from_json(map(), String.t()) :: String.t()
  defp fetch_value_from_json(json, key) do
    case Map.get(json, key) do
      nil -> {:error, "#{key} not found in JSON"}
      value -> {:ok, value}
    end
  end

  @spec distinguish_endpoints(String.t()) :: {:ok, {String.t(), String.t()}}
  defp distinguish_endpoints(hostname) do
    {:ok, {"control." <> hostname, "cache." <> hostname}}
  end

  @spec form_credential(String.t(), String.t(), String.t()) :: {:ok, t()} | {:error, String.t()}
  defp form_credential(control_endpoint, cache_endpoint, auth_token) do
    {:ok,
     %Momento.Auth.Credential{
       control_endpoint: control_endpoint,
       cache_endpoint: cache_endpoint,
       auth_token: auth_token
     }}
  end

  @spec decode_legacy_token(String.t()) :: {:ok, t()} | {:error, String.t()}
  defp decode_legacy_token(token) do
    with {:ok, claims} <- decode_jwt(token),
         {:ok, control_endpoint} <- get_claim(claims, "cp"),
         {:ok, cache_endpoint} <- get_claim(claims, "c") do
      form_credential(control_endpoint, cache_endpoint, token)
    else
      error -> error
    end
  end

  defp decode_jwt(token) do
    case Joken.peek_claims(token) do
      {:ok, claims} ->
        {:ok, claims}

      _ ->
        {:error, "Invalid JWT"}
    end
  end

  defp get_claim(claims, claim_key) do
    case Map.get(claims, claim_key) do
      nil ->
        {:error, "#{claim_key} not found in JWT claims"}

      claim_value ->
        {:ok, claim_value}
    end
  end
end
