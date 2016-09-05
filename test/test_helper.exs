defmodule TestModules do

  alias ECS.Component, as: Component
  alias ECS.EntitySystem, as: EntitySystem
  use Bitwise
  use ECS.Store

  defstore Store do
    defcomponent C1, 0, [k: 0, v: 0]
    defcomponent C2, 1, [x: 0, y: 0, z: 0]
    defcomponent C3, 2, [foo: ""]
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
