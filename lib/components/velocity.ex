defmodule Velocity do

  use Bitwise

  @behaviour EntityComponent

  @cmp_type :velocity
  @cmp_flag 1 <<< 3

  defstruct [x: 0, y: 0, z: 0]

  def get_type, do: @cmp_type

  def get_flag, do: @cmp_flag

end
