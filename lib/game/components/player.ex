defmodule Game.Component.Player do
  @moduledoc """
  Component containing positional data about a logged in player
  """
  use ECS.Component

  component(:player, 0, [name: ""])

end
