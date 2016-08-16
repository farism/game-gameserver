defmodule Position do

  use Bitwise

  @behaviour EntityComponent

  defstruct [x: 0, y: 0, z: 0]

  def get_type do
    :position
  end

  def get_flag do
    1 <<< 2
  end

end
