defmodule Momento.Error do
  @enforce_keys [:error_code, :cause, :message]
  defstruct [:error_code, :cause, :message]

  @type t() :: %__MODULE__{
          error_code: Momento.Error.Code.t(),
          cause: Exception.t() | nil,
          message: String.t()
        }

  @spec convert(error :: Exception.t()) :: Momento.Error.t()
  def convert(%Momento.Error{} = error), do: error
  def convert(%GRPC.RPCError{} = error), do: convert_grpc_error(error)

  def convert(%Protobuf.EncodeError{} = error),
    do: invalid_argument("protobuf encode error", error)

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
        %Momento.Error{
          error_code: Momento.Error.Code.cancelled_error(),
          cause: error,
          message: "The request was cancelled by the server; please contact Momento."
        }

      # Unknown
      2 ->
        %Momento.Error{
          error_code: Momento.Error.Code.unknown_service_error(),
          cause: error,
          message: "The service returned an unknown response; please contact Momento."
        }

      # InvalidArgument
      3 ->
        %Momento.Error{
          error_code: Momento.Error.Code.bad_request_error(),
          cause: error,
          message: "The request was invalid; please contact Momento."
        }

      # DeadlineExceeded
      4 ->
        %Momento.Error{
          error_code: Momento.Error.Code.timeout_error(),
          cause: error,
          message:
            "The client's configured timeout was exceeded; you may need to use a Configuration with more lenient timeouts."
        }

      # NotFound
      5 ->
        %Momento.Error{
          error_code: Momento.Error.Code.not_found_error(),
          cause: error,
          message:
            "A cache with the specified name does not exist. To resolve this error, make sure you have created the cache before attempting to use it."
        }

      # AlreadyExists
      6 ->
        %Momento.Error{
          error_code: Momento.Error.Code.already_exists_error(),
          cause: error,
          message:
            "A cache with the specified name already exists. To resolve this error, either delete the existing cache and make a new one, or use a different name."
        }

      # PermissionDenied
      7 ->
        %Momento.Error{
          error_code: Momento.Error.Code.permission_error(),
          cause: error,
          message: "Insufficient permissions to perform an operation on a cache."
        }

      # ResourceExhausted
      8 ->
        %Momento.Error{
          error_code: Momento.Error.Code.limit_exceeded_error(),
          cause: error,
          message:
            "Request rate, bandwidth, or object size exceeded the limits for this account. To resolve this error, reduce your usage as appropriate or contact Momento to request a limit increase."
        }

      # FailedPrecondition
      9 ->
        %Momento.Error{
          error_code: Momento.Error.Code.bad_request_error(),
          cause: error,
          message: "The request was invalid; please contact Momento."
        }

      # Aborted
      10 ->
        %Momento.Error{
          error_code: Momento.Error.Code.internal_server_error(),
          cause: error,
          message:
            "An unexpected error occurred while trying to fulfill the request; please contact Momento."
        }

      # OutOfRange
      11 ->
        %Momento.Error{
          error_code: Momento.Error.Code.bad_request_error(),
          cause: error,
          message: "The request was invalid; please contact Momento."
        }

      # Unimplemented
      12 ->
        %Momento.Error{
          error_code: Momento.Error.Code.bad_request_error(),
          cause: error,
          message: "The request was invalid; please contact Momento."
        }

      # Internal
      13 ->
        %Momento.Error{
          error_code: Momento.Error.Code.internal_server_error(),
          cause: error,
          message:
            "An unexpected error occurred while trying to fulfill the request; please contact Momento."
        }

      # Unavailable
      14 ->
        %Momento.Error{
          error_code: Momento.Error.Code.server_unavailable(),
          cause: error,
          message:
            "The server was unable to handle the request; consider retrying. If the error persists, please contact Momento."
        }

      # DataLoss
      15 ->
        %Momento.Error{
          error_code: Momento.Error.Code.internal_server_error(),
          cause: error,
          message:
            "An unexpected error occurred while trying to fulfill the request; please contact Momento."
        }

      # Unauthenticated
      16 ->
        %Momento.Error{
          error_code: Momento.Error.Code.authentication_error(),
          cause: error,
          message: "Invalid authentication credentials to connect to the cache service."
        }
    end
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
