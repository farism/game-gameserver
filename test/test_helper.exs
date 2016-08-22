defmodule TestComponents do

  use Bitwise

  defmodule C1 do
    def get_type, do: :c1
    def get_flag, do: 1 <<< 0
  end

  defmodule C2 do
    def get_type, do: :c2
    def get_flag, do: 1 <<< 1
  end

  defmodule C3 do
    def get_type, do: :c2
    def get_flag, do: 1 <<< 2
  end

end

defmodule TestSystems do

  use Bitwise

  defmodule S1 do
    use EntitySystem
    def get_type, do: :s1
    def get_flag, do: 1 <<< 0
  end

end

ExUnit.start()
