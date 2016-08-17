defmodule Movement do

  use Bitwise

  @behaviour EntitySystem

  @sys_type :movement
  @sys_flag 1 <<< 1

  def get_type, do: @sys_type

  def get_flag, do: @sys_flag

  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def check_entity do

  end

  def register_entity do

  end

  def process([head|tail]) do
    IO.puts(inspect(head))
    process(tail)
  end

  def process([]) do
    []
  end

end
