defmodule ECS do
  @moduledoc """
  Provides methods for orchestrating the ECS. Call tick from your main game loop.
  """

  def tick(pid, systems) do
    Enum.each(systems, fn(system) ->
      apply(system, :process, [pid])
    end)

    tick(pid, systems)
  end

  def add_entity(pid, entity) do

  end

  def remove_entity(pid, entity) do

  end

  def freeze_entity(pid, entity) do

  end

  def thaw_entity(pid, entity) do

  end

  def add_component(pid, entity, component) do

  end

  def remove_component(pid, entity, component) do

  end

  def freeze_component(pid, entity, component) do

  end

  def thaw_component(pid, entity) do

  end

  def add_system(pid, system) do

  end

  def remove_system(pid, system) do

  end

  def freeze_system(pid, system) do

  end

  def thaw_system(pid, system) do

  end

end
