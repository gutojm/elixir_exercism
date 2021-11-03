defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort(inventory,& &1.price <= &2.price)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory,& &1[:price] == nil)
  end

  def increase_quantity(%{quantity_by_size: q} = item, _) when q == %{}, do: item

  def increase_quantity(%{quantity_by_size: %{s: s, m: m, l: l, xl: xl}} = item, count) do
    %{item|quantity_by_size: %{s: s+count, m: m+count, l: l+count, xl: xl+count}}
  end

  def total_quantity(%{quantity_by_size: q}) when q == %{}, do: 0

  def total_quantity(%{quantity_by_size: %{s: s, m: m, l: l, xl: xl}}), do: s+m+l+xl
end
