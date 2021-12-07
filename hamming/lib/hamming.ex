defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2), do: {:error, "strands must be of equal length"}
  def hamming_distance(strand1, strand2) do
    {
      :ok,
      Enum.with_index(strand1)
      |> Enum.reduce(0, fn {c, idx}, acc ->
        if Enum.at(strand2, idx) == c do
          acc
        else
          acc + 1
        end
      end)
    }
  end
end
