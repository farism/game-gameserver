defmodule Movement do

  use EntitySystem

  system(:movement, 1, [all: [Position, Velocity]])

end
