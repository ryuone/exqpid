defmodule Exqpid.Mixfile do
  use Mix.Project

  def project do
    [app: :exqpid,
     version: "0.0.1",
     elixir: "~> 0.14.3-dev",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: []]
  end

  # Dependencies
  defp deps do
    [
      {:qpidpn, git: "https://github.com/bakusoku/qpid-erlang", branch: "qpid-bakusoku", app: false},
    ]
  end
end
