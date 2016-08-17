defmodule Aspect do
  @moduledoc """
    A module for dealing with component aspects. An aspect is used by an
    entity system for checking if the system is interested in a
    given entity, based on the components attached to that entity
  """

  use Bitwise

  defstruct [all: 0, none: 0, one: 0]

  @doc """
    Returns an aspect where an entity must posses all of the specified components

    ## Example
      iex> a = %Aspect{}
      ...> Aspect.all(a, [C1, C2])
      %Aspect{all: 3, none: 0, one: 0}

  """
  def all(aspect, components \\ []) do
    %{aspect | all: get_flags(aspect.all, components) }
  end

  @doc """
    Returns an aspect where an entity must posses none of the specified components

    ## Example
      iex> a = %Aspect{}
      ...> Aspect.none(a, [C1, C2])
      %Aspect{all: 0, none: 3, one: 0}

  """
  def none(aspect, components \\ []) do
    %{aspect | none: get_flags(aspect.none, components) }
  end

  @doc """
    Returns an aspect where an entity must posses one of the specified components

    ## Example
      iex> a = %Aspect{}
      ...> Aspect.one(a, [C1, C2])
      %Aspect{all: 0, none: 0, one: 3}

  """
  def one(aspect, components \\ []) do
    %{aspect | one: get_flags(aspect.one, components) }
  end

  defp get_flags(flags, []) do
    flags
  end

  defp get_flags(flags, [head|tail]) do
    get_flags(flags ^^^ head.get_flag, tail)
  end

end
