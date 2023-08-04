defmodule Momento.MixProject do
  use Mix.Project

  def project do
    [
      app: :gomomento,
      version: "0.5.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      description: description(),
      package: package(),
      name: "Momento Elixir SDK",
      source_url: "https://github.com/momentohq/client-sdk-elixir",
      homepage_url: "https://www.gomomento.com/"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(_), do: ["lib", "generated"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false},
      {:grpc, "~> 0.5.0"},
      {:protobuf, "~> 0.12.0"},
      {:google_protos, "~> 0.3"},
      {:joken, "~> 2.5"},
      {:jason, "~> 1.4"},
      {:tls_certificate_check, "~> 1.19"}
    ]
  end

  defp description() do
    "Elixir client SDK for Momento Serverless Cache."
  end

  defp package() do
    [
      files: ~w(lib generated .formatter.exs mix.exs ../README.md ../LICENSE),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/momentohq/client-sdk-elixir"}
    ]
  end
end
