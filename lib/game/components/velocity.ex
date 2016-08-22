defmodule Game.Component.Velocity do

  use ECS.Component

  component(:velocity, 2, [x: 0, y: 0, z: 0])

end
