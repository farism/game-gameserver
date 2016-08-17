defmodule Store do

  @initialState %{
    entities: %{},
    components: %{},
  }

  @doc """
    Starts a new store.
  """
  def start_link do
    Agent.start_link(fn -> @initialState end)
  end

  @doc """
    Gets an `entity` from the `store` by `id`.

    ## Example
      iex> {:ok, store} = Store.start_link
      ...> Store.put_entity(store, %Entity{id: 1})
      ...> Store.get_entity(store, 1)
      %Entity{id: 1}

  """
  @spec put_entity(any, number) :: Entity.t
  def get_entity(store, id) do
    Agent.get(store, fn(state) -> get_in(state, [:entities, id]) end)
  end

  @doc """
    Puts the `entity` for the given `id` in the `store`.

    ## Example
      iex> {:ok, store} = Store.start_link
      ...> Store.put_entity(store, %Entity{id: 1})
      ...> Store.get_entity(store, 1)
      %Entity{id: 1}

  """
  @spec put_entity(any, Entity.t) :: any
  def put_entity(store, entity) do
    id = Entity.get_id(entity)
    Agent.update(store, fn(state) -> put_in(state, [:entities, id], entity) end)
  end
end
