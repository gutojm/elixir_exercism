defmodule RotationalCipher do
  @alphabet_lower ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
  @alphabet_upper ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

  defp encode(text,list,shift) do
    pos = Enum.find_index(list, & &1 == text)
    if pos == nil do
      text
    else
      pos = rem(pos + shift,length(list))
      Enum.at(list,pos)
    end
  end

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    for x <- String.split(text,"") do      
      encode(x,@alphabet_lower,shift)
      |> encode(@alphabet_upper,shift)
    end
    |> Enum.join()
  end
end
