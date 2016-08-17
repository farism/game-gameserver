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

  test "all sets all flags", context do
    aspect = Aspect.all(context.aspect, [C1, C2]);

    assert aspect == %Aspect{all: 3, none: 0, one: 0}
  end

  test "all updates all flags", context do
    aspect = Aspect.all(context.aspect, [C1]);

    assert aspect == %Aspect{all: 1, none: 0, one: 0}

    aspect = Aspect.all(context.aspect, [C2]);

    assert aspect == %Aspect{all: 3, none: 0, one: 0}
  end

  test "none sets none flags", %{aspect: aspect} do
    assert Aspect.none(aspect, [C1, C2]) == %Aspect{all: 0, none: 3, one: 0}
  end

  test "one sets one flags", %{aspect: aspect} do
    assert Aspect.one(aspect, [C1, C2]) == %Aspect{all: 0, none: 0, one: 3}
  end

end
