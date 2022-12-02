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

  test ".highest_calorie_elf_total returns the calorie count of the elf holding the highest number of calories" do
    output = InventoryRegister.from_file("test/fixtures/inventory_register.txt")

    assert InventoryRegister.highest_calorie_elf_total(output) == 24000
  end

  test ".highest_three_calorie_totals returns the calorie sum of the three highest calorie owning elves" do
    output = InventoryRegister.from_file("test/fixtures/inventory_register.txt")

    assert InventoryRegister.highest_three_calorie_totals(output) == 45000
  end
end
