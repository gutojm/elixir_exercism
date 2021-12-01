defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, fn x ->
      base = String.upcase(base)
      x = String.upcase(x)

      base != x and anagram?(base,x)
    end)
  end

  defp anagram?(base, x) when length(base) != length(x), do: false
  defp anagram?(base, x) do
    {b, r} =
      drop_match({to_charlist(base),to_charlist(x)})

    b == [] and r == []
  end

  defp drop_match({[], []}), do: {[], []}
  defp drop_match({v1, v2}) when length(v1) != length(v2), do: {v1, v2}
  defp drop_match({[to_drop|tail], list}) do
    drop_match({tail, List.delete(list, to_drop)})
  end

end
