defmodule Store do

  use GenServer

  @initialState %{
    entities: %{},
    components: %{},
    systems: %{},
  }

  def start_link(name) do
    GenServer.start_link(__MODULE__, @initialState, name: name)
  end

  def get_entity(pid, id) do
    GenServer.call(pid, {:get_entity, id})
  end

  def put_entity(pid, entity) do
    GenServer.call(pid, {:put_entity, entity})
  end

  def delete_entity(pid, entity) do
    GenServer.call(pid, {:delete_entity, entity})
  end

  def get_component(pid, id) do
    GenServer.call(pid, {:get_component, id})
  end

  def put_component(pid, entity, component) do
    GenServer.call(pid, {:put_component, entity})
  end

  def delete_component(pid, entity, component) do
    GenServer.call(pid, {:delete_component, entity})
  end

  def handle_call(request, from, state) do
    super(request, from, state)
  end

  def handle_cast(request, state) do
    super(request, state)
  end

end
