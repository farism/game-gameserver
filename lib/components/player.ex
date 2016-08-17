defmodule Player do

  use Bitwise

  @behaviour EntityComponent

  @cmp_type :player
  @cmp_flag 1 <<< 1

  def get_type, do: @cmp_type

  def get_flag, do: @cmp_flag

end
