defmodule Entity do

  use Bitwise

  defstruct id: 0, components: 0

  @type t :: %__MODULE__{}

  def get_id(entity) do
    entity.id
  end

  @doc """
    Returns an entity with the specified component flags set

    ## Example
      iex> Entity.set(%Entity{}, [C1])
      %Entity{components: 1}

  """
  @spec set(__MODULE__.t, list) :: __MODULE__.t
  def set(entity, components) do
    %__MODULE__{entity | components: entity.components ^^^ get_flags(components) }
  end

  @doc """
    Returns an entity with the specified component flags unset

    ## Example
      iex> Entity.set(%Entity{components: 1}, [C1])
      %Entity{components: 0}

  """
  @spec set(__MODULE__.t, list) :: __MODULE__.t
  def unset(entity, components) do
    %__MODULE__{entity | components: entity.components &&& ~~~(get_flags(components)) }
  end

  @spec get_flags(list) :: number
  defp get_flags(components) do
    Enum.reduce(components, 0, &(&2 ^^^ &1.get_flag))
  end

end
