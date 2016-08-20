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

  defmodule C3 do
    @behaviour EntityComponent
    def get_type, do: :c2
    def get_flag, do: 1 <<< 2
  end

  doctest Aspect

  test "`all` sets all flags" do
    assert Aspect.all(%Aspect{}, [C1, C3]) == %Aspect{all: 5}
  end

  test "`none` sets none flags" do
    assert Aspect.none(%Aspect{}, [C1, C3]) == %Aspect{none: 5}
  end

  test "`one` sets one flags" do
    assert Aspect.one(%Aspect{}, [C1, C3]) == %Aspect{one: 5}
  end

  test "`check_all` returns true when entity fully contains aspect's all flags" do
    aspect = Aspect.all(%Aspect{}, [C1, C2])
    entity = Entity.set(%Entity{}, [C1, C2, C3])
    assert Aspect.check_all(aspect, entity)
  end

  test "`check_all` returns false when entity does not fully contain aspect's all flags" do
    aspect = Aspect.all(%Aspect{}, [C1, C2, C3])
    entity = Entity.set(%Entity{}, [C1, C2])
    assert Aspect.check_all(aspect, entity) == false
  end

  test "`check_none` returns true when entity does not contain aspect's none flags" do
    aspect = Aspect.none(%Aspect{}, [C1, C2])
    entity = Entity.set(%Entity{}, [C3])
    assert Aspect.check_none(aspect, entity)
  end

  test "`check_none` returns false when entity contains one or more of aspect's none flags" do
    aspect = Aspect.none(%Aspect{}, [C1, C2])
    entity = Entity.set(%Entity{}, [C1])
    assert !Aspect.check_none(aspect, entity)
    entity = Entity.set(%Entity{}, [C1, C2, C3])
    assert !Aspect.check_none(aspect, entity)
  end

  # test "`check_one` returns true when entity contains one of aspect's one flags" do
  #   aspect = Aspect.one(%Aspect{}, [C1, C3])
  #   entity = Entity.set(%Entity{}, [C1, C2, C3])
  #   assert Aspect.check_one(aspect, entity)
  # end

end
