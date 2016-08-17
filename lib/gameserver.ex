defmodule Gameserver do

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(EntityManager, [EntityManager])
    ]

    entity = EntityManager.create_entity(1)

    IO.puts(inspect(entity))

    opts = [strategy: :one_for_one, name: Gameserver.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def loop do
  end

end
