defmodule Aspect do
  @moduledoc """
  Provides methods for creating and manipulating aspects. An `aspect` is used
  by an `EntitySystem` to check if the system is interested in a
  given `entity`, based on the components attached to that entity.
  """

  use Bitwise

  defstruct all: 0, none: 0, one: 0

  @type t :: %__MODULE__{all: integer, none: integer, one: integer}

  @type component_list :: [atom]

  @doc """
  Shorthand for creating an `aspect`

    ## Examples

      # iex> Aspect.new()
      # ...> Aspect.all(a, [C1, C2])
      # %Aspect{all: 3, none: 0, one: 0}

  """
  def new(options \\ []) do
    %__MODULE__{}
      |> Aspect.all(Keyword.get(options, :all, []))
      |> Aspect.none(Keyword.get(options, :none, []))
      |> Aspect.one(Keyword.get(options, :one, []))
  end

  @doc """
  Returns an `aspect` where an entity must posses all of the specified components.

    ## Examples

      iex> a = %Aspect{}
      ...> Aspect.all(a, [C1, C2])
      %Aspect{all: 3, none: 0, one: 0}

  """
  @spec all(__MODULE__.t, component_list) :: __MODULE__.t
  def all(aspect, components \\ []) do
    %__MODULE__{aspect | all: get_flags(components) }
  end

  @doc """
  Returns an `aspect` where an entity must posses none of the specified components.

    ## Examples

      iex> a = %Aspect{}
      ...> Aspect.none(a, [C1, C2])
      %Aspect{all: 0, none: 3, one: 0}

  """
  @spec none(__MODULE__.t, component_list) :: __MODULE__.t
  def none(aspect, components \\ []) do
    %__MODULE__{aspect | none: get_flags(components) }
  end

  @doc """
  Returns an `aspect` where an entity must posses one of the specified components.

    ## Examples

      iex> a = %Aspect{}
      ...> Aspect.one(a, [C1, C2])
      %Aspect{all: 0, none: 0, one: 3}

  """
  @spec one(__MODULE__.t, component_list) :: __MODULE__.t
  def one(aspect, components \\ []) do
    %__MODULE__{aspect | one: get_flags(components) }
  end

  @doc """
  Returns true if `entity` passes each `aspect` check (`all`, `none`, and `one`)

    ## Examples

      iex> a = %Aspect{}
      ...> a = a |> Aspect.all([C1]) |> Aspect.none([C2]) |> Aspect.one([C3])
      ...> e = Entity.new([components: [C1, C3]])
      ...> Aspect.check(a, e)
      true

  """
  @spec check(__MODULE__.t, Entity.t) :: boolean
  def check(aspect, entity) do
    check_all(aspect, entity) and
    check_none(aspect, entity)
    # and
    # check_one(aspect, entity)
  end

  @doc """
  Returns true if `entity` contains all components in `aspect.all`,
  otherwise it returns false

    ## Examples

      iex> a = Aspect.all(%Aspect{}, [C1, C2])
      ...> e = Entity.new([components: [C1, C2]])
      ...> Aspect.check_all(a, e)
      true

  """
  @spec check_all(__MODULE__.t, Entity.t) :: boolean
  def check_all(aspect, entity) do
    (aspect.all ||| entity.components) == entity.components
  end

  @doc """
  Returns true if `entity` contains none of components in `aspect.none`,
  otherwise it returns false

    ## Examples

      iex> a = Aspect.none(%Aspect{}, [C1, C2])
      ...> e = Entity.new([components: [C3]])
      ...> Aspect.check_none(a, e)
      true

  """
  @spec check_none(__MODULE__.t, Entity.t) :: boolean
  def check_none(aspect, entity) do
    (aspect.none &&& entity.components) == 0
  end

  @doc """
  Returns true if `entity` contains one of the components in `aspect.one`,
  otherwise it returns false

    ## Examples

      iex> a = Aspect.one(%Aspect{}, [C1, C2])
      ...> e = Entity.new([components: [C1, C3]])
      ...> Aspect.check_one(a, e)
      true

  """
  @spec check_one(__MODULE__.t, Entity.t) :: boolean
  def check_one(aspect, entity) do
    (aspect.one &&& entity.components) != 0
  end

  # accumulates flags
  @spec get_flags(component_list) :: integer
  defp get_flags(components) do
    Enum.reduce(components, 0, &(&2 ^^^ &1.get_flag))
  end

end
