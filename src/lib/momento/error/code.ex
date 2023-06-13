defmodule Momento.Error.Code do
  @type t ::
          :invalid_argument_error
          | :unknown_service_error
          | :already_exists_error
          | :not_found_error
          | :internal_server_error
          | :permission_error
          | :authentication_error
          | :cancelled_error
          | :limit_exceeded_error
          | :bad_request_error
          | :timeout_error
          | :server_unavailable
          | :client_resource_exhausted
          | :unknown

  def invalid_argument_error, do: :invalid_argument_error
  def unknown_service_error, do: :unknown_service_error
  def already_exists_error, do: :already_exists_error
  def not_found_error, do: :not_found_error
  def internal_server_error, do: :internal_server_error
  def permission_error, do: :permission_error
  def authentication_error, do: :authentication_error
  def cancelled_error, do: :cancelled_error
  def limit_exceeded_error, do: :limit_exceeded_error
  def bad_request_error, do: :bad_request_error
  def timeout_error, do: :timeout_error
  def server_unavailable, do: :server_unavailable
  def client_resource_exhausted, do: :client_resource_exhausted
  def unknown, do: :unknown
end
