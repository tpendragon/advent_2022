defmodule Advent.ElfTest do
  use ExUnit.Case
  doctest Advent.Elf
  alias Advent.{InventoryRegister, Elf}

  test ".total_calories counts the number of calories" do
    output = InventoryRegister.from_file("test/fixtures/inventory_register.txt")

    assert Elf.total_calories(Enum.at(output, 0)) == 6000
    assert Elf.total_calories(Enum.at(output, 1)) == 4000
    assert Elf.total_calories(Enum.at(output, 2)) == 11000
    assert Elf.total_calories(Enum.at(output, 3)) == 24000
    assert Elf.total_calories(Enum.at(output, 4)) == 10000
  end
end
