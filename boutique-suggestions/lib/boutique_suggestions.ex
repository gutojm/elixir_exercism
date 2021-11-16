defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    for x <- tops, y <- bottoms, filter(x, y, options), do: {x, y}
  end

  defp filter(x, y, options) do
    x.base_color != y.base_color and x.price + y.price <= Keyword.get(options,:maximum_price,100)
  end
end
