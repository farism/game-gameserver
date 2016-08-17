defmodule Entity do

  use Bitwise

  defstruct [id: 0, components: 0]

  def set_component(entity, module) do
    %{entity |
      components: entity.components ||| (apply(module, :get_flag, [])),
    }
  end

  def unset_component(entity, module) do
    %{entity |
      components: entity.components &&& ~~~(apply(module, :get_flag, [])),
    }
  end

end
