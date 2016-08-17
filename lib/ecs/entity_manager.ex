defmodule EntityManager do

  def start_link(name) do
    Agent.start_link(fn -> %{ entities: [], components: %{} } end, name: name)
  end

  def create_entity(agent) do

  end

  def get_entity(agent, entityId) do

  end

  def add_entity(agent, entity) do

  end

  def remove_entity(agent, entity) do

  end

  def add_component(agent, entity, component) do

  end

  def remove_component(agent, entity, component) do

  end

end
