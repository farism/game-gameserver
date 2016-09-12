defmodule Gameserver do

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    port = Application.get_env(:gameserver, "tcp_port", 8000)

    children = [
      worker(Net.Listener, [port])
    ]

    opts = [strategy: :one_for_one, name: Gameserver.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
