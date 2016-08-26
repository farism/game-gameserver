defmodule Game.Component.Position do
  @moduledoc """
  Component containing `x`, `y`, `z` spatial data
  """
  use ECS.Component

  component(:position, 5, [x: 0.0, y: 0.0, z: 0.0])

end
