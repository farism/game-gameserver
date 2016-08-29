defmodule TestModules do

  alias ECS.Component, as: Component
  alias ECS.EntitySystem, as: EntitySystem
  use Bitwise

  defmodule Components do

    defmodule C1 do
      use Component
      component(0, [a: 0, b: 0, c: 0])
    end

    defmodule C2 do
      use Component
      component(1, [x: 0, y: 0, z: 0])
    end

    defmodule C3 do
      use Component
      component(2, [foo: "bar"])
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

defmodule Amnesia.Test do
  def start do
    Logger.remove_backend :console
    Amnesia.Schema.create
    Amnesia.start
    :ok
  end

  def stop do
    Amnesia.stop
    Amnesia.Schema.destroy
    Logger.add_backend :console, flush: true
    :ok
  end
end

ExUnit.start()
