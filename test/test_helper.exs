defmodule TestModules do

  alias ECS.Component, as: Component
  alias ECS.EntitySystem, as: EntitySystem
  use Bitwise

  defmodule Components do

    defmodule C1 do
      use Component
      component(:c1, 0, [])
    end

    defmodule C2 do
      use Component
      component(:c1, 1, [])
    end

    defmodule C3 do
      use Component
      component(:c1, 2, [])
    end
  end

  defmodule Systems do

    use Bitwise

    defmodule S1 do
      use EntitySystem
      system(:s1, 0, [])
    end

  end

end

ExUnit.start()
