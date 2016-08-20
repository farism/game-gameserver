defmodule StoreTest do

  use ExUnit.Case, async: true

  doctest Store

  setup_all do
    {:ok, store} = Store.start_link
    {:ok, %{ store: store }}
  end

  # test "stores and retrieves an entity by id", %{store: store} do
  #   assert Store.get_entity(store, 1) == nil
  #   Store.put_entity(store, %Entity{id: 1})
  #   assert Store.get_entity(store, 1) == %Entity{id: 1}
  # end

end
