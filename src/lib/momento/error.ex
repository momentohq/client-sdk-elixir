defmodule Momento.Error do
  @enforce_keys [:error_code, :cause, :message]
  defstruct [:error_code, :cause, :message]

  @type t() :: %__MODULE__{
          error_code: Momento.Error.Code.t(),
          cause: Exception.t() | nil,
          message: String.t()
        }

  defimpl String.Chars, for: Momento.Error do
    def to_string(error) do
      inspect(error)
    end
  end

  @spec convert(error :: Exception.t()) :: Momento.Error.t()
  def convert(%Momento.Error{} = error), do: error
  def convert(%GRPC.RPCError{} = error), do: convert_grpc_error(error)

  def convert(%Protobuf.EncodeError{} = error),
    do: invalid_argument("Unable to encode message. Check cause for details.", error)

  def convert(error),
    do: %Momento.Error{
      error_code: Momento.Error.Code.unknown(),
      cause: error,
      message: "Momento SDK Failed to process the request."
    }

  @spec convert_grpc_error(error :: GRPC.RPCError.t()) :: Momento.Error.t()
  defp convert_grpc_error(error) do
    case error.status do
      # Cancelled
      1 ->
        create_error(
          Momento.Error.Code.cancelled_error(),
          error,
          "The request was cancelled by the server; please contact Momento."
        )

      # Unknown
      2 ->
        create_error(
          Momento.Error.Code.unknown_service_error(),
          error,
          "The service returned an unknown response; please contact Momento."
        )

      # InvalidArgument
      3 ->
        create_error(
          Momento.Error.Code.bad_request_error(),
          error,
          "The request was invalid; please contact Momento."
        )

      # DeadlineExceeded
      4 ->
        create_error(
          Momento.Error.Code.timeout_error(),
          error,
          "The client's configured timeout was exceeded; you may need to use a Configuration with more lenient timeouts."
        )

      # NotFound
      5 ->
        create_error(
          Momento.Error.Code.not_found_error(),
          error,
          "A cache with the specified name does not exist. To resolve this error, make sure you have created the cache before attempting to use it."
        )

      # AlreadyExists
      6 ->
        create_error(
          Momento.Error.Code.already_exists_error(),
          error,
          "A cache with the specified name already exists. To resolve this error, either delete the existing cache and make a new one, or use a different name."
        )

      # PermissionDenied
      7 ->
        create_error(
          Momento.Error.Code.permission_error(),
          error,
          "Insufficient permissions to perform an operation on a cache."
        )

      # ResourceExhausted
      8 ->
        handle_limit_exceeded_error(error)

      # FailedPrecondition
      9 ->
        create_error(
          Momento.Error.Code.bad_request_error(),
          error,
          "The request was invalid; please contact Momento."
        )

      # Aborted
      10 ->
        create_error(
          Momento.Error.Code.internal_server_error(),
          error,
          "An unexpected error occurred while trying to fulfill the request; please contact Momento."
        )

      # OutOfRange
      11 ->
        create_error(
          Momento.Error.Code.bad_request_error(),
          error,
          "The request was invalid; please contact Momento."
        )

      # Unimplemented
      12 ->
        create_error(
          Momento.Error.Code.bad_request_error(),
          error,
          "The request was invalid; please contact Momento."
        )

      # Internal
      13 ->
        create_error(
          Momento.Error.Code.internal_server_error(),
          error,
          "An unexpected error occurred while trying to fulfill the request; please contact Momento."
        )

      # Unavailable
      14 ->
        create_error(
          Momento.Error.Code.server_unavailable(),
          error,
          "The server was unable to handle the request; consider retrying. If the error persists, please contact Momento."
        )

      # DataLoss
      15 ->
        create_error(
          Momento.Error.Code.internal_server_error(),
          error,
          "An unexpected error occurred while trying to fulfill the request; please contact Momento."
        )

      # Unauthenticated
      16 ->
        create_error(
          Momento.Error.Code.authentication_error(),
          error,
          "Invalid authentication credentials to connect to the cache service."
        )
    end
  end

  defp handle_limit_exceeded_error(error) do
    message = determine_limit_exceeded_message(error.metadata["err"] || "")

    %Momento.Error{
      error_code: Momento.Error.Code.limit_exceeded_error(),
      cause: error,
      message: message
    }
  end

  defp determine_limit_exceeded_message(error_cause) do
    case error_cause do
      "topic_subscriptions_limit_exceeded" ->
        "Topic subscriptions limit exceeded."

      "operations_rate_limit_exceeded" ->
        "Operations rate limit exceeded."

      "throughput_rate_limit_exceeded" ->
        "Throughput rate limit exceeded."

      "request_size_limit_exceeded" ->
        "Request size limit exceeded."

      "item_size_limit_exceeded" ->
        "Item size limit exceeded."

      "element_size_limit_exceeded" ->
        "Element size limit exceeded."

      _ ->
        default_limit_exceeded_message(error_cause)
    end
  end

  defp default_limit_exceeded_message(error_cause) do
    cond do
      String.contains?(String.downcase(error_cause), "subscribers") ->
        "Topic subscriptions limit exceeded."

      String.contains?(String.downcase(error_cause), "operations") ->
        "Operations rate limit exceeded."

      String.contains?(String.downcase(error_cause), "throughput") ->
        "Throughput rate limit exceeded."

      String.contains?(String.downcase(error_cause), "request limit") ->
        "Request size limit exceeded."

      String.contains?(String.downcase(error_cause), "item size") ->
        "Item size limit exceeded."

      String.contains?(String.downcase(error_cause), "element size") ->
        "Element size limit exceeded."

      true ->
        "Request rate, bandwidth, or object size exceeded the limits for this account. Reduce usage or contact Momento to request a limit increase."
    end
  end

  defp create_error(error_code, cause, message) do
    %Momento.Error{
      error_code: error_code,
      cause: cause,
      message: message
    }
  end

  @spec invalid_argument(message :: String.t(), cause :: Exception.t() | nil) :: Momento.Error.t()
  def invalid_argument(message, cause \\ nil) do
    %Momento.Error{
      error_code: Momento.Error.Code.invalid_argument_error(),
      cause: cause,
      message: "Invalid argument passed to Momento client: #{message}"
    }
  end
end
