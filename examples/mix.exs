defmodule Examples.MixProject do
  use Mix.Project

  def project do
    [
      app: :momento_examples,
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

  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false},
      {:gomomento, "0.40.0"},
      {:tls_certificate_check, "~> 1.19"},
      {:hdr_histogram, path: "../vendor/hdr_histogram_erl"}
    ]
  end
end
