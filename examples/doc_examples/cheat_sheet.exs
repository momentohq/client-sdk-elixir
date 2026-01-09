alias Momento.CacheClient

config = Momento.Configurations.Laptop.latest()
credential_provider = Momento.Auth.CredentialProvider.from_env_var_v2!()
default_ttl_seconds = 60.0
client = CacheClient.create!(config, credential_provider, default_ttl_seconds)
