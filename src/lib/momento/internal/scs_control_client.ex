defmodule Momento.Internal.ScsControlClient do
  @spec init_channel(Momento.Configuration.t(), Momento.Auth.CredentialProvider.t()) ::
          {:ok, GRPC.Channel.t()} | {:error, String.t()}
  def init_channel(config, credential_provider) do
    GRPC.Stub.connect(credential_provider.control_endpoint <> ":443",
      cred: GRPC.Credential.new([])
    )
  end
end
