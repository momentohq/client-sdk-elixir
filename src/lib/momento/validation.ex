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

  @spec validate_sorted_set_elements(elements :: %{binary() => float()} | [{binary(), float()}]) ::
          :ok | {:error, Momento.Error.t()}
  def validate_sorted_set_elements(nil),
    do: {:error, invalid_argument("Sorted set elements cannot be nil")}

  def validate_sorted_set_elements(elements) do
    try do
      case Enum.all?(elements, fn {value, score} ->
             is_binary(value) and is_float(score)
           end) do
        true ->
          :ok

        false ->
          {:error,
           invalid_argument(
             "Sorted set elements must contain only binary values and float scores"
           )}
      end
    rescue
      e ->
        {:error,
         invalid_argument(
           "Sorted set elements must be a map or list of tuples of values and scores",
           e
         )}
    end
  end

  @spec validate_sort_order(sort_order :: atom()) :: :ok | {:error, Momento.Error.t()}
  def validate_sort_order(sort_order) when sort_order in [:asc, :desc], do: :ok

  def validate_sort_order(_),
    do: {:error, invalid_argument("The sort order must be either :asc or :desc")}

  @spec validate_key(key :: binary()) :: :ok | {:error, Momento.Error.t()}
  def validate_key(key), do: validate_binary(key, "key")

  @spec validate_value(value :: binary()) :: :ok | {:error, Momento.Error.t()}
  def validate_value(value), do: validate_binary(value, "value")

  @spec validate_score(score :: float()) :: :ok | {:error, Momento.Error.t()}
  def validate_score(score), do: validate_float(score, "score")

  @spec validate_ttl(ttl :: float()) :: :ok | {:error, Momento.Error.t()}
  def validate_ttl(ttl), do: validate_positive_float(ttl, "TTL")

  @spec validate_collection_ttl(collection_ttl :: Momento.Requests.CollectionTtl.t()) ::
          :ok | {:error, Momento.Error.t()}
  def validate_collection_ttl(collection_ttl) do
    with :ok <-
           validate_struct(
             collection_ttl,
             "collection_ttl",
             Elixir.Momento.Requests.CollectionTtl
           ),
         :ok <- validate_positive_float(collection_ttl.ttl_seconds, "TTL") do
      :ok
    else
      error -> error
    end
  end

  @spec validate_index_range(start_index :: integer() | nil, end_index :: integer() | nil) ::
          :ok | {:error, Momento.Error.t()}
  def validate_index_range(nil, _), do: :ok
  def validate_index_range(_, nil), do: :ok

  def validate_index_range(start_index, _) when not is_integer(start_index),
    do: {:error, invalid_argument("#{start_index} is not an integer")}

  def validate_index_range(_, end_index) when not is_integer(end_index),
    do: {:error, invalid_argument("#{end_index} is not an integer")}

  def validate_index_range(start_index, end_index) when start_index < end_index, do: :ok

  def validate_index_range(_, _),
    do:
      {:error,
       invalid_argument("start_index (inclusive) must be less than end_index (exclusive)")}

  @spec validate_not_nil(any(), String.t()) :: :ok | {:error, Momento.Error.t()}
  def validate_not_nil(nil, name), do: {:error, invalid_argument("#{name} cannot be nil")}
  def validate_not_nil(_, _), do: :ok

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

  @spec validate_binary(binary :: binary(), binary_name :: String.t()) ::
          :ok | {:error, Momento.Error.t()}
  defp validate_binary(nil, binary_name),
    do: {:error, invalid_argument("The #{binary_name} cannot be nil")}

  defp validate_binary(binary, _) when is_binary(binary), do: :ok

  defp validate_binary(_, binary_name),
    do: {:error, invalid_argument("The #{binary_name} must be a binary")}

  @spec validate_positive_float(float :: float(), float_name :: String.t()) ::
          :ok | {:error, Momento.Error.t()}
  defp validate_positive_float(float, float_name) do
    case validate_float(float, float_name) do
      :ok ->
        if float > 0.0 do
          :ok
        else
          {:error, invalid_argument("The #{float_name} must be positive")}
        end

      error ->
        error
    end
  end

  @spec validate_float(float :: float(), float_name :: String.t()) ::
          :ok | {:error, Momento.Error.t()}
  defp validate_float(nil, float_name),
    do: {:error, invalid_argument("The #{float_name} cannot be nil")}

  defp validate_float(float, _) when is_float(float), do: :ok

  defp validate_float(_, float_name),
    do: {:error, invalid_argument("The #{float_name} must be a float")}

  @spec validate_struct(struct :: struct(), struct_name :: String.t(), struct_type :: atom()) ::
          :ok | {:error, Momento.Error.t()}
  defp validate_struct(nil, struct_name, _),
    do: {:error, invalid_argument("The #{struct_name} cannot be nil")}

  defp validate_struct(struct, _, struct_type) when struct.__struct__ == struct_type, do: :ok

  defp validate_struct(_, struct_name, struct_type),
    do: {:error, invalid_argument("#{struct_name} must be an #{Atom.to_string(struct_type)}")}
end
