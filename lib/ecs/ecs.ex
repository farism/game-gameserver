defmodule ECS do
  @moduledoc """
  Provides methods for orchestrating the ECS. Call tick from your main game loop.
  """

  use GenServer

  @initialState %{
    entities: %{},
    components: %{},
    systems: %{},
  }

  # client

  def start_link(name) do
    GenServer.start_link(__MODULE__, @initialState, name: name)
  end

  def tick(systems) do
    Enum.each(systems, fn(system) ->
      apply(system, :process, [])
    end)

    tick(systems)
  end

  def add_entity(entity) do

  end

  def remove_entity(entity) do

  end

  def freeze_entity(entity) do

  end

  def thaw_entity(entity) do

  end

  def add_component(entity, component) do

  end

  def remove_component(entity, component) do

  end

  def freeze_component(entity, component) do

  end

  def thaw_component(entity) do

  end

  def add_system(system) do

  end

  def remove_system(system) do

  end

  def freeze_system(system) do

  end

  def thaw_system(system) do

  end

  # server

  def handle_call(request, from, state) do
    super(request, from, state)
  end

  def handle_cast(request, state) do
    super(request, state)
  end

end
