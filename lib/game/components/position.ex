defmodule Game.Component.Position do

  use ECS.Component

  component(:position, 1, [x: 0, y: 0, z: 0])

end
