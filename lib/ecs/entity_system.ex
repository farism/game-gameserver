defmodule ECS.EntitySystem do

  @type entity_list :: [Entity.t]

  @callback process(entity_list) :: any

  @doc false
  defmacro __using__(_) do

    quote do
      import ECS.EntitySystem, only: [system: 3]

      @behaviour ECS.EntitySystem

      @type entity_list :: ECS.EntitySystem.entity_list

    end

  end

  defmacro system(type, flag, aspect) do

    use Bitwise

    quote do

      def get_type, do: unquote(type)

      def get_flag, do: unquote(1 <<< flag)

      def get_aspect, do: ECS.Aspect.new(unquote(aspect))

    end

  end

end
