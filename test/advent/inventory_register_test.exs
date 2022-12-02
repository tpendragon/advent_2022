defmodule Advent.InventoryRegisterTest do
  use ExUnit.Case
  doctest Advent.InventoryRegister
  alias Advent.{InventoryRegister, Elf, Food}

  test ".from_file returns a register parsed from a file" do
    output = InventoryRegister.from_file("test/fixtures/inventory_register.txt")

    assert length(output) == 5
    assert %Elf{inventory: [%Food{calories: 1000}, %Food{calories: 2000}, %Food{calories: 3000}]} = hd(output)
    assert length(Enum.at(output, 1).inventory) == 1
    assert length(Enum.at(output, 2).inventory) == 2
    assert length(Enum.at(output, 3).inventory) == 3
    assert length(Enum.at(output, 4).inventory) == 1
  end
end
