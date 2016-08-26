defmodule ECS.Component do
  @moduledoc """
  Macros for creating component types
  """

  @callback get_type :: atom

  @callback get_integer :: atom

  def to_type(value) do
    cond do
      is_atom(value) -> "atom"
      is_binary(value) -> "binary"
      is_bitstring(value) -> "bitstring"
      is_boolean(value) -> "boolean"
      is_float(value) -> "float"
      is_integer(value) -> "integer"
      is_list(value) -> "list"
      is_map(value) -> "map"
      is_nil(value) -> "nil"
      is_number(value) -> "number"
      is_pid(value) -> "pid"
      is_port(value) -> "port"
      is_reference(value) -> "reference"
      is_tuple(value) -> "tuple"
      true -> "unknown type"
    end
  end

  @doc false
  defmacro __using__(_) do
    quote do
      import ECS.Component, only: [component: 3]
    end
  end

  @spec component(atom, integer, [key: any]) :: module
  defmacro component(type, flag, properties \\ []) do

    use Bitwise

    quote do
      @doc """
      The `#{to_string(__MODULE__) |> String.split(".") |> List.last}` struct.

      It contains these fields:

        #{Enum.map(unquote(properties), fn({key, default}) ->
          "* `:#{to_string(key)}` - #{ECS.Component.to_type(default)}" <> "\r\n"
        end)}
      """
      defstruct unquote(properties)

      @doc """
      Returns this module's `type` as an atom
      """
      @spec get_type :: unquote(type)
      def get_type, do: unquote(type)

      @doc """
      Returns this module's bitmask `flag` as an integer
      """
      @spec get_flag :: unquote(1 <<< flag)
      def get_flag, do: unquote(1 <<< flag)
    end

  end

end
