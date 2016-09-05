use Amnesia

defmodule ECS.Component do
  @moduledoc """
  Macros for creating components
  """

  use Bitwise

  @doc false
  defmacro __using__(_) do
    quote do
      # require ECS.Component
      import ECS.Component, only: [defcomponent: 3, defcomponent: 4]
      use Amnesia
    end
  end

  defmacro defcomponent(name, flag, attributes \\ nil, do_block \\ []) do
    ai = quote(do: [{:id, autoincrement}, :entity_id])
    quote do
      deftable unquote(name), unquote(ai ++ attributes), type: :ordered_set do
        unquote(do_block)

        def get_flag do
          1 <<< unquote(flag)
        end

        def get(entity) do
        end

        def get!(entity) do
        end

        def entity(self) do
          Amnesia.transaction do
            unquote(__CALLER__.module).Entity.read(self.entity_id)
          end
        end

        def entity!(self) do
          unquote(__CALLER__.module).Entity.read!(self.entity_id)
        end
      end
    end
  end

end
