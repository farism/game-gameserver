defmodule ECS do

  def start_link(name) do
    Agent.start_link(fn -> %{ entities: [], components: %{} } end, name: name)
  end

  def new do
  end

end
