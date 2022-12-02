defmodule Advent.InventoryRegister do
  alias Advent.Elf
  def from_file(file) do
    contents = File.read!(file) |> String.split("\n\n") |> Enum.map(&Elf.from_register/1)
  end

  def highest_calorie_elf_total(elves) do
    elves
    |> Enum.map(&Elf.total_calories/1)
    |> Enum.max()
  end

  def highest_three_calorie_totals(elves) do
    elves
    |> Enum.map(&Elf.total_calories/1)
    |> Enum.sort
    |> Enum.reverse
    |> Enum.take(3)
    |> Enum.sum
  end
end
