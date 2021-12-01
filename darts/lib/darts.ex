defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    do_score(:math.sqrt(:math.pow(x, 2) + :math.pow(y, 2))  )
  end

  defp do_score(r) when r <= 1, do: 10
  defp do_score(r) when r <= 5, do: 5
  defp do_score(r) when r <= 10, do: 1
  defp do_score(_), do: 0
end
