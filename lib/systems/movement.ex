defmodule Movement do

  use Bitwise
  use EntitySystem

  @sys_type :movement
  @sys_flag 1 <<< 1

  def get_type, do: @sys_type

  def get_flag, do: @sys_flag

end
