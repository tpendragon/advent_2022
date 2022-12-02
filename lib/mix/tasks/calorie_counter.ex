defmodule Mix.Tasks.CalorieCounter do
  alias Advent.{InventoryRegister, Elf}
  @moduledoc "Usage: mix calorie_counter [inventory_register.txt] [nil, top_three]
  Given an elf inventory returns the highest number of calories a single elf holds.
  "
  use Mix.Task

  @impl Mix.Task
  @requirements ["app.config"]

  def run([inventory_file, "top_three"]) when is_binary(inventory_file) do
    InventoryRegister.from_file(inventory_file)
    |> InventoryRegister.highest_three_calorie_totals
    |> Integer.to_string()
    |> Mix.shell().info()
  end

  def run([inventory_file]) when is_binary(inventory_file) do
    InventoryRegister.from_file(inventory_file)
    |> InventoryRegister.highest_calorie_elf_total
    |> Integer.to_string()
    |> Mix.shell().info()
  end
end
