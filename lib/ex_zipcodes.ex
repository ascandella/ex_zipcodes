defmodule ExZipcodes do
  @moduledoc """
  Documentation for `ExZipcodes`.
  """

  alias ExZipcodes.Registry

  @doc """
  Look up a US zip code.

  ## Examples

      iex> ExZipcodes.lookup(10011)
      {:ok, %{
         city: "New York",
         state: "NY"
        }}

      iex> ExZipcodes.lookup("not a zip code")
      {:error, "Zip code not found"}

  """
  def lookup(zip_code) do
    Registry.lookup(zip_code)
  end
end
