defmodule Velocity do

  use Bitwise

  @behaviour Component

  defstruct [x: 0, y: 0, z: 0]

  def get_type do
    :velocity
  end

  def get_flag do
    1 <<< 3
  end

end
