defmodule Momento.MixProject do
  use Mix.Project

  def project do
    [
      app: :momento,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(_), do: ["lib", "generated"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false},
      {:grpc, "~> 0.5.0"},
      {:protobuf, "~> 0.12.0"},
      {:google_protos, "~> 0.3"},
      {:joken, "~> 2.5"},
      {:jason, "~> 1.4"},
      {:tls_certificate_check, "~> 1.19"}
    ]
  end
end
