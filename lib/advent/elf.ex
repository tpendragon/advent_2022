defmodule Advent.Elf do
  alias Advent.{Food, Elf}
  defstruct inventory: []

  def from_register(register) do
    %Elf{
      inventory: register
        |> String.split("\n")
        |> Enum.map(&Food.from_calories/1)
        |> Enum.filter(& !is_nil(&1))
    }
  end

  def total_calories(%Elf{inventory: inventory}) do
    inventory |> Enum.map(& Map.get(&1, :calories)) |> Enum.sum
  end
end
