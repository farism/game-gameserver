defmodule Gameserver do

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Store, [Store])
    ]

    opts = [strategy: :one_for_one, name: Gameserver.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def loop(systems) do
    loop(systems)
  end

end
