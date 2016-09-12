defmodule Net.Listener do

  def start_link(port) do
    opts = [port: port]
    :ranch.start_listener(:gameserver, 10, :ranch_tcp, opts, Net.Protocol, [])
  end

end
