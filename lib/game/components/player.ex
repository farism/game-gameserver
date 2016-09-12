defmodule Game.Component.Player do

  defstruct [name: ""]

  def new(name) do
    %__MODULE__{name: name}
  end

  def new do
    %__MODULE__{}
  end

end
