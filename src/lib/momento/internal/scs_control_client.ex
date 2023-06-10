defmodule Momento.Internal.ScsControlClient do
  alias Momento.Auth.CredentialProvider
  alias Momento.Configuration

  @enforce_keys [:auth_token, :channel]
  defstruct [:auth_token, :channel]

  @opaque t() :: %__MODULE__{
            auth_token: String.t(),
            channel: GRPC.Channel.t()
          }

  @spec create!(CredentialProvider.t()) :: t()
  def create!(credential_provider) do
    control_endpoint = CredentialProvider.control_endpoint(credential_provider)
    tls_options = :tls_certificate_check.options(control_endpoint)

    {:ok, channel} =
      GRPC.Stub.connect(control_endpoint <> ":443",
        cred: GRPC.Credential.new(ssl: tls_options)
      )

    %__MODULE__{
      auth_token: CredentialProvider.auth_token(credential_provider),
      channel: channel
    }
  end
end
