defmodule Mix.Tasks.CalorieCounter do
  @moduledoc "Usage: mix calorie_counter [input]
  Given an elf inventory returns the highest number of calories a single elf holds.
  "
  use Mix.Task

  @impl Mix.Task
  @requirements ["app.config"]
  def run(args) do
    Mix.shell().info("Sup #{args}")
  end
end
