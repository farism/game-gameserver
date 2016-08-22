defmodule ECS.Component do
  @moduledoc """
  Macros for creating component types
  """

  @doc false
  defmacro __using__(_) do
    quote do
      import ECS.Component, only: [component: 3]
    end
  end

  @spec component(atom, integer, [key: any]) :: module
  defmacro component(type, flag, properties \\ []) do

    use Bitwise

    if length(properties) > 0 do
      quote do
        defstruct unquote(properties)
      end
    end

    quote do
      def get_type, do: unquote(type)

      def get_flag, do: unquote(1 <<< flag)
    end

  end

end
