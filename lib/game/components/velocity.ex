defmodule Game.Component.Velocity do

  defstruct [x: 0.0, y: 0.0, z: 0.0]

  def new(x, y, z) do
    %__MODULE__{x: x, y: y, z: z}
  end

  def new do
    %__MODULE__{}
  end

end
