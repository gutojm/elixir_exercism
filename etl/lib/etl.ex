defmodule ETL do
  @doc """
  Transforms an old Scrabble score system to a new one.

  ## Examples

    iex> ETL.transform(%{1 => ["A", "E"], 2 => ["D", "G"]})
    %{"a" => 1, "d" => 2, "e" => 1, "g" => 2}
  """
  @spec transform(map) :: map
  def transform(input) do
    Map.keys(input)
    |> Enum.reduce(%{}, fn points, acc1 ->
      Map.get(input,points)
      |> Enum.reduce(acc1, fn letter, acc2 ->
        Map.put(acc2, String.downcase(letter), points)
      end)
    end)
  end
end
