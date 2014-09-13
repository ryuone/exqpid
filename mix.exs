defmodule Exqpid.Mixfile do
  use Mix.Project

  def project do
    [app: :exqpid,
     version: "0.0.1",
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
      {:qpidpn, git: "git@github.com:bakusoku/qpid-erlang.git", branch: "qpid-bakusoku", app: false},
    ]
  end
end
