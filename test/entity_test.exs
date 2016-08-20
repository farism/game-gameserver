defmodule EntityTest do

  use ExUnit.Case, async: true
  use Bitwise

  defmodule C1 do
    @behaviour EntityComponent
    def get_type, do: :c1
    def get_flag, do: 1 <<< 0
  end

  defmodule C2 do
    @behaviour EntityComponent
    def get_type, do: :c2
    def get_flag, do: 1 <<< 1
  end

  doctest Entity

  test "sets multiple component flags" do
    assert Entity.set(%Entity{}, [C1, C2]) == %Entity{components: 3}
  end

  test "unsets multiple component flags" do
    assert Entity.unset(%Entity{components: 3}, [C1, C2]) == %Entity{components: 0}
  end

end
