defmodule Telegex.MixProject do
  use Mix.Project

  @version "1.0.0-rc.2"
  @description "A Telegram Bot API client based on data and code generation, which is always correct and updated with lightning speed."

  def project do
    [
      app: :telegex,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      dialyzer: dialyzer(),
      aliases: aliases(),
      deps: deps(),
      description: @description,
      package: package(),
      name: "Telegex",
      source_url: "https://github.com/telegex/telegex",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/telegex/telegex"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger] ++ extra_applications(),
      mod: {Telegex.Application, []}
    ]
  end

  def extra_applications do
    if Mix.env() in [:dev, :test] do
      [:httpoison, :req, :finch, :multipart]
    else
      []
    end
  end

  defp dialyzer do
    [
      plt_add_apps: [:iex, :mix]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.29", only: :dev, runtime: false},
      {:httpoison, "~> 2.1", optional: true, only: [:dev, :test]},
      {:req, "~> 0.3", optional: true, only: [:dev, :test]},
      {:finch, "~> 0.16.0", optional: true, only: [:dev, :test]},
      {:multipart, "~> 0.4.0", optional: true, only: [:dev, :test]},
      {:floki, "~> 0.34.3", only: [:dev, :test]},
      {:typed_struct, "~> 0.3.0"},
      {:jason, "~> 1.4"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "gen.all": ["gen.doc_json", "gen.code", "format"]
    ]
  end
end
