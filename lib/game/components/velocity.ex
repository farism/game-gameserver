defmodule Game.Component.Velocity do
  @moduledoc """
  Component containing `x`, `y`, `z` velocity data
  """
  use ECS.Component

  component(:velocity, 2, [x: 0.0, y: 0.0, z: 0.0])

end
