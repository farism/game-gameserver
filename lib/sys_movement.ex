defmodule Movement do

  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def check_entity do

  end

  def register_entity do

  end

  def process([head|tail]) do
    process(tail)
  end

  def process([]) do
    []
  end

end
