use ECS.Store
use Bitwise

defstore GameStore do

  defcomponent Player, 0, [:name]

  defcomponent Position, 1, [x: 0, y: 0, z: 0]

  defcomponent Velocity, 2, [x: 0, y: 0, z: 0]

end
