defmodule Component do
  @moduledoc """
  Base module for implementing component behaviour
  """

  @callback get_type :: atom

  @callback get_flag :: Integer

end
