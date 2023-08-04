defmodule Momento.Validation do
  import Momento.Error

  @spec validate_cache_name(cache_name :: String.t()) :: :ok | {:error, Momento.Error.t()}
  def validate_cache_name(cache_name) do
    validate_string(cache_name, "cache name")
  end

  @spec validate_sorted_set_name(sorted_set_name :: String.t()) ::
          :ok | {:error, Momento.Error.t()}
  def validate_sorted_set_name(sorted_set_name) do
    validate_string(sorted_set_name, "sorted set name")
  end

  @spec validate_string(string :: String.t(), name_type :: String.t()) ::
          :ok | {:error, Momento.Error.t()}
  defp validate_string(nil, string_name),
    do: {:error, invalid_argument("The #{string_name} cannot be nil")}

  defp validate_string(string, string_name) do
    with true <- is_binary(string),
         String.valid?(string) do
      :ok
    else
      _ -> {:error, invalid_argument("The #{string_name} must be a string")}
    end
  end
end
