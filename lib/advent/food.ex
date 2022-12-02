defmodule Advent.Food do
  defstruct calories: 0

  def from_calories("") do
    nil
  end
  def from_calories(calories) when is_binary(calories) do
    {calories, _} = Integer.parse(calories)
    from_calories(calories)
  end
  def from_calories(calories) do
    %Advent.Food{calories: calories}
  end
end
