defmodule EntitySystem do

  @callback get_type() :: atom
  @callback get_flag :: number
  @callback process(list) :: any

  @doc false
  defmacro __using__(_) do
    quote location: :keep do
      @behaviour EntitySystem

      @doc false
      def process(entities) do
      end

      defoverridable [process: 1]
    end
  end

end
