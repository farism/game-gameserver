defmodule EntitySystem do

  @doc false
  defmacro __using__(_) do

    quote do
      import EntitySystem, only: [system: 3]

      @type entity_list :: [Entity.t]

      @callback process(list) :: any

      @doc false
      @spec process(entity_list) :: any
      def process(entities) do

      end

      defoverridable [process: 1]

    end

  end

  defmacro system(type, flag, aspect) do

    use Bitwise

    quote do

      def get_type, do: unquote(type)

      def get_flag, do: unquote(1 <<< flag)

      def get_aspect, do: Aspect.new(unquote(aspect))

    end

  end

end
