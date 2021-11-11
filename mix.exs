defmodule ExZipcodes.MixProject do
  use Mix.Project

  @source_url "https://github.com/ascandella/ex_zipcodes"

  def project do
    [
      app: :ex_zipcodes,
      version: "0.1.0",
      elixir: "~> 1.11",
      description: "Zip code lookup utility, turns Zip into City/State",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      name: "ExZipcodes",
      source_url: @source_url
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ExZipcodes.Application, []}
    ]
  end

  defp deps do
    [{:jason, "~> 1.0.0"}]
  end

  defp package() do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
