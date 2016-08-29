use Amnesia
use ECS.Store

defstore Store do
  defcomponent C1, 0, [:x, :y, :z]
end

defmodule StoreTest do

  use ExUnit.Case, async: true

  alias Store.Entity, as: Entity
  alias Store.C1, as: C1

  setup do
    Store.create!

    on_exit fn ->
      Store.destroy
    end
  end

  setup_all do
    Amnesia.Test.start

    on_exit fn ->
      Amnesia.Test.stop
    end
  end

  test "defines an `entity` table" do
    assert(Amnesia.transaction! do
      %Entity{} |> Entity.write
    end == %Entity{id: 1})
  end

  test "injects `{:id, autoincrement}` attribute" do
    assert(Amnesia.transaction! do
      %C1{} |> C1.write
    end == %C1{id: 1})
    assert(Amnesia.transaction! do
      %C1{} |> C1.write
    end == %C1{id: 2})
  end

  test "injects `entity_id` attribute" do
    assert(Amnesia.transaction! do
      %C1{} |> C1.write
    end |> Map.has_key?(:entity_id))
  end

  test "injects `get_flag` function" do
    assert(C1.__info__(:functions) |> Keyword.get(:get_flag) == 0)
  end

  test "injects `entity` function" do
    assert(Amnesia.transaction! do
      e = %Entity{} |> Entity.write
      %C1{entity_id: e.id} |> C1.write |> C1.entity
    end == %Entity{id: 1})
  end

end
