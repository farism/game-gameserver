defmodule Net.Protocol do

  def start_link(ref, socket, transport, opts) do
    pid = spawn_link(__MODULE__, :init, [ref, socket, transport, opts])
    {:ok, pid}
  end

  def init(ref, socket, transport, _Opts) do
    :ranch.accept_ack(ref)
    IO.puts "client connected: #{inspect(socket)}"
    loop(socket, transport)
  end

  def loop(socket, transport) do
    case transport.recv(socket, 0, 600000) do
      {:ok, data} ->
        # <<first :: bitstring-size(8), _ :: binary>> = data
        IO.puts "client #{inspect(socket)} sent #{byte_size(data)} bytes: #{inspect(data)}"
        transport.send(socket, data)
        loop(socket, transport)
      {_, :closed} ->
        IO.puts "client disconnected: #{inspect(socket)}"
      {_, :timeout} ->
        IO.puts "client timed out: #{inspect(socket)}"
        :ok = transport.close(socket)
      {_, data} ->
        IO.puts "client error: #{inspect(data)}"
    end
  end

end
