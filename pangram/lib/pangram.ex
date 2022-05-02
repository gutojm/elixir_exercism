defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    make_alphabet_list()
    |> check_used_letters(sentence)
  end

  def make_alphabet_list() do
    for n <- ?a..?z, do: n
  end

  def check_used_letters(l, sentence) do
    Enum.count(l) ==
      String.downcase(sentence)
      |> String.to_charlist()
      |> Enum.uniq()
      |> Enum.filter(&Enum.member?(l,&1))
      |> Enum.count()
  end

end
