defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """

  @vowells ~c'aeiou'
  @xy ~c'xy'

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do

  end

  def rule1-2(phrase) do
    case begins_with_vowel_sound?(phrase) do
      true -> phrase <> "ay"
      false -> move_consonants(phrase)
    end
  end

  def begins_with_vowel_sound?(<<l1>>) do
    Enum.member?(@vowells, l1)
  end

  def begins_with_vowel_sound?(<<l1, l2, _::binary>>) do
    Enum.member?(@vowells, l1) || (
      Enum.member?(@xy, l1) && l2 == ?t
    )
  end

  def move_consonants()
end
