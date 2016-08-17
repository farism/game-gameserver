defmodule AspectTest do

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

  doctest Aspect

  setup_all do
    {:ok, [aspect: %Aspect{}]}
  end

  test "all sets all flags" do
    assert Aspect.all(%Aspect{}, [C1, C2]) == %Aspect{all: 3}
  end

  test "all sets all flags while preserving old flags" do
    assert Aspect.all(%Aspect{}, [C1]) == %Aspect{all: 1}
    assert Aspect.all(%Aspect{all: 1}, [C2]) == %Aspect{all: 3}
  end

  test "none sets none flags", %{aspect: aspect} do
    assert Aspect.none(aspect, [C1, C2]) == %Aspect{none: 3}
  end

  test "none sets none flags while preserving old flags" do
    assert Aspect.none(%Aspect{}, [C1]) == %Aspect{none: 1}
    assert Aspect.none(%Aspect{none: 1}, [C2]) == %Aspect{none: 3}
  end

  test "one sets one flags" do
    assert Aspect.one(%Aspect{}, [C1, C2]) == %Aspect{one: 3}
  end

  test "one sets one flags while preserving old flags" do
    assert Aspect.one(%Aspect{}, [C1]) == %Aspect{one: 1}
    assert Aspect.one(%Aspect{one: 1}, [C2]) == %Aspect{one: 3}
  end

end
