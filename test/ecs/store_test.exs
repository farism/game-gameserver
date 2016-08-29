use Amnesia
use ECS.Store

defstore Store do
  defcomponent C1, 0, [:x, :y, :z]
end

defmodule StoreTest do

  use ExUnit.Case, async: true

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

  test "enables autoincrement for all tables" do
    assert(Amnesia.transaction! do
      %C1{} |> C1.write
    end == %C1{id: 1})
    assert(Amnesia.transaction! do
      %C1{} |> C1.write
    end == %C1{id: 2})
  end

  test "injects entity_id attribute all tables" do
    assert(Amnesia.transaction! do
      %C1{} |> C1.write
    end |> Map.has_key?(:entity_id))
  end

  test "injects get_flag function for all tables" do
    assert(C1.__info__(:functions) |> Keyword.get(:get_flag) == 0)
  end

end
