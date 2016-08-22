defmodule AspectTest do

  use ExUnit.Case, async: true

  alias ECS.Aspect, as: Aspect
  alias ECS.Entity, as: Entity
  alias TestModules.Components.C1, as: C1
  alias TestModules.Components.C2, as: C2
  alias TestModules.Components.C3, as: C3

  doctest Aspect

  test "`new` creates an aspect with the proper `all`, `none`, and `one` flags set" do
    assert Aspect.new([all: [C1, C3], none: [C2], one: [C3]]) == %Aspect{all: 5, none: 2, one: 4}
  end

  test "`new` creates an aspect with the proper `all`, `none`, and `one` flags set to zero if no options are set" do
    assert Aspect.new() == %Aspect{all: 0, none: 0, one: 0}
  end

  test "`new` creates an aspect with `all` flags set to zero if no `all` option is set" do
    assert Aspect.new([none: [C1], one: [C2]]) == %Aspect{all: 0, none: 1, one: 2}
  end

  test "`new` creates an aspect with `none` flags set to zero if no `none` option is set" do
    assert Aspect.new([all: [C1], one: [C2]]) == %Aspect{all: 1, none: 0, one: 2}
  end

  test "`new` creates an aspect with `all` flags set to zero if no `one` option is set" do
    assert Aspect.new([all: [C1], none: [C2]]) == %Aspect{all: 1, none: 2, one: 0}
  end

  test "`all` sets all flags" do
    assert Aspect.all(%Aspect{}, [C1, C3]) == %Aspect{all: 5}
  end

  test "`none` sets none flags" do
    assert Aspect.none(%Aspect{}, [C1, C3]) == %Aspect{none: 5}
  end

  test "`one` sets one flags" do
    assert Aspect.one(%Aspect{}, [C1, C3]) == %Aspect{one: 5}
  end

  test "`check_all` returns true when entity fully contains `aspect's` all flags" do
    aspect = Aspect.all(%Aspect{}, [C1, C2])
    entity = Entity.new([components: [C1, C2, C3]])
    assert Aspect.check_all(aspect, entity)
  end

  test "`check_all` returns false when entity does not fully contain `aspect's` all flags" do
    aspect = Aspect.all(%Aspect{}, [C1, C2, C3])
    entity = Entity.new([components: [C1, C2]])
    assert Aspect.check_all(aspect, entity) == false
  end

  test "`check_none` returns true when entity does not contain `aspect's` none flags" do
    aspect = Aspect.none(%Aspect{}, [C1, C2])
    entity = Entity.new([components: [C3]])
    assert Aspect.check_none(aspect, entity)
  end

  test "`check_none` returns false when entity contains one or more of `aspect's` none flags" do
    aspect = Aspect.none(%Aspect{}, [C1, C2])
    entity = Entity.new([components: [C1]])
    assert !Aspect.check_none(aspect, entity)
    entity = Entity.new([components: [C1, C2, C3]])
    assert !Aspect.check_none(aspect, entity)
  end

  test "`check_one` returns true when entity contains one of `aspect's` one flags" do
    aspect = Aspect.one(%Aspect{}, [C1, C3])
    entity = Entity.new([components: [C1, C2, C3]])
    assert Aspect.check_one(aspect, entity)
  end

  test "`check_one` returns false when entity contains none of `aspect's` one flags" do
    aspect = Aspect.one(%Aspect{}, [C1, C3])
    entity = Entity.new([components: [C2]])
    assert !Aspect.check_one(aspect, entity)
  end

end
