defmodule Entity do

  use Bitwise

  defstruct [id: 0, components: 0]

  def get_id(entity) do
    entity.id
  end

  def set(entity, components) when is_list(components) do
    %{entity | components: entity.components ^^^ get_flags(components) }
  end

  def set(entity, component) do
    %{entity | components: entity.components ^^^ (component.get_flag) }
  end

  def unset(entity, components) when is_list(components) do
    %{entity | components: entity.components &&& ~~~(get_flags(components)) }
  end

  def unset(entity, component) do
    %{entity | components: entity.components &&& ~~~(component.get_flag) }
  end

  defp get_flags(components) do
    Enum.reduce(components, 0, &(&2 ^^^ &1.get_flag))
  end

end
