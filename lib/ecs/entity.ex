defmodule Entity do

  use Bitwise

  defstruct id: 0, components: 0, systems: 0

  @type t :: %__MODULE__{}

  @doc """
    Returns an entity with the specified component flags set

    ## Example
      iex> Entity.new([components: [C1, C2]])
      %Entity{components: 3}

  """
  @spec new(list) :: __MODULE__.t
  def new(options \\ []) do
    %__MODULE__{}
      |> set({:component, Keyword.get(options, :components, [])})
      |> set({:system, Keyword.get(options, :systems, [])})
  end

  @doc """
    Returns an entity with the specified type flags set

    ## Example
      iex> Entity.set(%Entity{}, {:component, [C1]})
      %Entity{components: 1}

  """
  @spec set(__MODULE__.t, {atom, list}) :: __MODULE__.t
  def set(entity, items) do
    case items do
      {:component, components} ->
        %__MODULE__{entity | components: entity.components ^^^ get_flags(components)}
      {:system, systems} ->
        %__MODULE__{entity | systems: entity.systems ^^^ get_flags(systems)}
    end
  end

  @doc """
    Returns an entity with the specified type flags unset

    ## Example
      iex> Entity.set(%Entity{systems: 1}, {:system, [S1]})
      %Entity{systems: 0}

  """
  @spec unset(__MODULE__.t, {atom, list}) :: __MODULE__.t
  def unset(entity, items) do
    case items do
      {:component, components} ->
        %__MODULE__{entity | components: entity.components &&& ~~~(get_flags(components))}
      {:system, systems} ->
        %__MODULE__{entity | systems: entity.systems &&& ~~~(get_flags(systems))}
    end
  end

  @doc false
  @spec get_flags(list) :: number
  defp get_flags(components) do
    Enum.reduce(components, 0, &(&2 ^^^ &1.get_flag))
  end

end
