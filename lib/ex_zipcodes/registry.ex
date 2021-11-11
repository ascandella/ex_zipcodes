defmodule ExZipcodes.Registry do
  @moduledoc false
  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> %{loaded: false} end, name: __MODULE__)
  end

  @doc """
  Look up a Zip code.
  """
  def lookup(zip_code) do
    Agent.get_and_update(__MODULE__, fn state ->
      state = lazy_load_data(state)
      {lookup_zip(state, to_string(zip_code)), state}
    end)
  end

  defp lookup_zip(%{error: true}, _) do
    {:error, "Error loading zip database"}
  end

  defp lookup_zip(%{zips: zip_data}, zip_code) do
    case Map.get(zip_data, zip_code) do
      nil -> {:error, "Zip code not found"}
      found -> {:ok, %{city: found["c"], state: found["s"]}}
    end
  end

  defp lazy_load_data(%{error: true} = state), do: state
  defp lazy_load_data(%{loaded: true} = state), do: state

  defp lazy_load_data(_state) do
    with {:ok, body} <- File.read(data_filename()),
         {:ok, json} <- Jason.decode(body) do
      %{
        loaded: true,
        zips: json
      }
    else
      _ ->
        %{loaded: true, error: true}
    end
  end

  defp data_filename() do
    Application.app_dir(:ex_zipcodes, "priv/data")
    |> Path.join("zips.json")
  end
end
