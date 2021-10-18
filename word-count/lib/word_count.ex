defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    to_string(sentence)
    |> String.replace("_"," ")
    |> String.replace([":","@","!",":","$","&","%","^",","]," ")
    |> String.downcase()
    |> String.replace(~r/ +/, " ")
    |> String.trim()    
    |> String.split([" ",",",", "])
    |> Enum.frequencies()
  end
end
