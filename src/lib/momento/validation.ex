defmodule Momento.Validation do
  import Momento.Error

  @spec validate_cache_name(String.t()) :: :ok | {:error, Momento.Error.t()}
  def validate_cache_name(nil), do: {:error, invalid_argument("The cache name cannot be nil")}

  def validate_cache_name(cache_name) do
    if String.valid?(cache_name),
      do: :ok,
      else: {:error, invalid_argument("The cache name must be a string")}
  end

  @spec validate_key(binary()) :: :ok | {:error, Momento.Error.t()}
  def validate_key(nil), do: {:error, invalid_argument("The key cannot be nil")}
  def validate_key(key) when is_binary(key), do: :ok
  def validate_key(_), do: {:error, invalid_argument("The key must be a binary")}

  @spec validate_value(binary()) :: :ok | {:error, Momento.Error.t()}
  def validate_value(nil), do: {:error, invalid_argument("The value cannot be nil")}
  def validate_value(value) when is_binary(value), do: :ok
  def validate_value(_), do: {:error, invalid_argument("The value must be a binary")}

  @spec validate_ttl(float()) :: :ok | {:error, Momento.Error.t()}
  def validate_ttl(nil), do: {:error, invalid_argument("The TTL cannot be nil")}
  def validate_ttl(ttl) when is_float(ttl) and ttl > 0.0, do: :ok
  def validate_ttl(_), do: {:error, invalid_argument("The TTL must be a positive float")}
end
