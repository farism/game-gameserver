defmodule Player do

  use Bitwise

  @behaviour Component

  def get_type do
    :player
  end

  def get_flag do
    1 <<< 1
  end

end
