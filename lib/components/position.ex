defmodule Position do

  use Bitwise

  @behaviour EntityComponent

  @cmp_type :position
  @cmp_flag 1 <<< 2

  defstruct [x: 0, y: 0, z: 0]

  def get_type, do: @cmp_type

  def get_flag, do: @cmp_flag

end
