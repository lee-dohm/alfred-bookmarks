defmodule AlfredBookmarks.Mixfile do
  use Mix.Project

  def project do
    [
      app: :alfred_bookmarks,
      version: version(),
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: "A script for making Chrome bookmarks available to Alfred",
      deps: deps(),
      escript: escript()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:alfred, "~> 0.1.1"},
      {:ex_doc, "~> 0.14.5", only: :dev}
    ]
  end

  def escript do
    [
      main_module: AlfredBookmarks.CLI,
      name: "alfred-bookmarks",
      path: "bin/alfred-bookmarks"
    ]
  end

  defp version, do: String.trim(File.read!("VERSION.md"))
end
