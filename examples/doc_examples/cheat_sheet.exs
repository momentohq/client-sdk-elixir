alias Momento.CacheClient

config = %Momento.Config.Configuration{
  transport_strategy: %Momento.Config.Transport.TransportStrategy{
    grpc_config: %Momento.Config.Transport.GrpcConfiguration{
      deadline_millis: 5000
    }
  }
}

credential_provider = Momento.Auth.CredentialProvider.from_env_var!("MOMENTO_AUTH_TOKEN")
default_ttl_seconds = 60.0
client = CacheClient.create!(config, credential_provider, default_ttl_seconds)
