defmodule Gameserver do

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(ECS.EntityManager, [ECS.EntityManager])
    ]

    opts = [strategy: :one_for_one, name: Gameserver.Supervisor]
    Supervisor.start_link(children, opts)

    # setup
  end

  def setup do
  end

  def run(agent) do
  end

end
