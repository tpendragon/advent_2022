defmodule Mix.Tasks.CalorieCounter do
  alias Advent.{InventoryRegister, Elf}
  @moduledoc "Usage: mix calorie_counter [inventory_register.txt]
  Given an elf inventory returns the highest number of calories a single elf holds.
  "
  use Mix.Task

  @impl Mix.Task
  @requirements ["app.config"]
  def run([inventory_file | _]) when is_binary(inventory_file) do
    Advent.InventoryRegister.from_file(inventory_file)
    |> Enum.map(&Elf.total_calories/1)
    |> Enum.max()
    |> Integer.to_string()
    |> Mix.shell().info()
  end
end
