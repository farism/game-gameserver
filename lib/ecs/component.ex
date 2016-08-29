use Amnesia

defmodule ECS.Component do
  @moduledoc """
  Macros for creating components
  """

  use Bitwise

  @doc false
  defmacro __using__(_) do
    quote do
      import ECS.Component, only: [component: 2, defcomponent: 3, defcomponent: 4]
    end
  end

  defmacro defcomponent(name, flag, attributes \\ nil, do_block \\ []) do
    ai = quote(do: [{:id, autoincrement}, :entity_id])
    quote do
      deftable unquote(name), unquote(ai ++ attributes), type: :ordered_set do
        unquote(do_block)

        def get_flag do
          1 <<< unquote(1)
        end

        def entity(self) do
          unquote(__CALLER__.module).Entity.read(self.entity_id)
        end

        def entity!(self) do
          unquote(__CALLER__.module).Entity.read!(self.entity_id)
        end
      end
    end
  end

  @spec component(integer, [key: any]) :: module
  defmacro component(flag, attributes \\ []) do

    quote do
      @doc """
      Returns this module's name, split from the fully qualified name
      """
      @spec get_name :: String.t
      def get_name, do: unquote(Module.split(__CALLER__.module) |> List.last)

      @doc """
      Returns this module's bitmask `flag` as an integer
      """
      @spec get_flag :: unquote(1 <<< flag)
      def get_flag, do: unquote(1 <<< flag)

      @doc """
      Returns this module's properties as a keyword list
      """
      @spec get_properties :: []
      def get_properties, do: unquote(attributes)
    end

  end

end
