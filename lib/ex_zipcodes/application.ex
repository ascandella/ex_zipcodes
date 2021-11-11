defmodule ExZipcodes.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    children = [
      ExZipcodes.Registry
    ]

    opts = [strategy: :one_for_one, name: ExZipcodes.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
