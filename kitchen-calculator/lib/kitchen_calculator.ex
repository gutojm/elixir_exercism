defmodule KitchenCalculator do
  def get_volume({_,n}) do
    n
  end

  def to_milliliter({:milliliter,n}), do: {:milliliter,n}
  def to_milliliter({:cup,n}), do: {:milliliter,n * 240}
  def to_milliliter({:fluid_ounce,n}), do: {:milliliter,n * 30}
  def to_milliliter({:teaspoon,n}), do: {:milliliter,n * 5}
  def to_milliliter({:tablespoon,n}), do: {:milliliter,n * 15}

  def from_milliliter({:milliliter,n}, :milliliter = unit), do: {unit,n}
  def from_milliliter({:milliliter,n}, :cup = unit), do: {unit,n / 240}
  def from_milliliter({:milliliter,n}, :fluid_ounce = unit), do: {unit,n / 30}
  def from_milliliter({:milliliter,n}, :teaspoon = unit), do: {unit,n / 5}
  def from_milliliter({:milliliter,n}, :tablespoon = unit), do: {unit,n / 15}

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end
end
