defmodule EntityTest do

  alias ECS.Entity, as: Entity
  alias TestModules.Components.C1, as: C1
  alias TestModules.Components.C2, as: C2
  alias TestModules.Systems.S1, as: S1

  use ExUnit.Case, async: true

  doctest Entity

  test "`new` returns an empty entity when no options are supplied" do
    assert Entity.new() == %Entity{}
  end

  test "`new` returns an entity with the specified components and systems toggled on" do
    assert Entity.new([components: [C1], systems: [S1]]) == %Entity{components: 1, systems: 1}
  end

  test "`new` returns an entity with the specified components toggled on" do
    assert Entity.new([components: [C1, C2]]) == %Entity{components: 3}
  end

  test "`new` returns an entity with the specified systems toggled on" do
    assert Entity.new([systems: [S1]]) == %Entity{systems: 1}
  end

  test "`set` returns a new entity with the specified components toggled on" do
    assert Entity.set(%Entity{}, {:component, [C1, C2]}) == %Entity{components: 3}
  end

  test "`unset` returns a new entity with the specified components toggled off" do
    assert Entity.unset(%Entity{components: 3}, {:component, [C1, C2]}) == %Entity{components: 0}
  end

end
