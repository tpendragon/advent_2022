defmodule Advent.InventoryRegister do
  alias Advent.Elf
  def from_file(file) do
    contents = File.read!(file) |> String.split("\n\n") |> Enum.map(&Elf.from_register/1)
  end
end
