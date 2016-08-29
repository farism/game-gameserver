defmodule Game.Component.Player do
  @moduledoc """
  Component containing positional data about a logged in player
  """
  use ECS.Component

  defmacro __using__(_) do
    use Bitwise

    quote do
      def get_flag, do: 1 <<< 0
    end
  end

end
