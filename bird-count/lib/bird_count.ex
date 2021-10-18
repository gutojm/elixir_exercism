defmodule BirdCount do
  def today([]), do: nil
  def today([n|_]), do: n

  def increment_day_count([]), do: [1]
  def increment_day_count([h|t]), do: [h+1|t]

  def has_day_without_birds?(list) do
    Enum.filter(list,& &1 == 0)
    |> length() > 0
  end

  def total([]), do: 0
  def total([h|t]), do: h+total(t)

  def busy_days([]), do: 0
  def busy_days([h|t]) when h < 5, do: busy_days(t)
  def busy_days([h|t]), do: 1+busy_days(t)
end
