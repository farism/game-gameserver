defmodule ECS.Store do

  use Amnesia

  @doc false
  defmacro __using__(_) do
    quote do
      import ECS.Store, only: [defstore: 2]
      use ECS.Component
    end
  end

  def start, do: Amnesia.start

  def stop, do: Amnesia.stop

  defmacro defstore(name, do_block \\ []) do
    quote do
      defdatabase unquote(name) do
        deftable Entity, [{:id, autoincrement}, :debug], type: :ordered_set do

        end
        unquote(do_block)
      end
    end
  end

end
