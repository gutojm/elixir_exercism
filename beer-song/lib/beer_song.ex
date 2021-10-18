defmodule BeerSong do
  defp how_many(number,cap) do
    cond do 
      number < 0 -> "99 bottles"
      number > 1 -> "#{number} bottles"
      number == 1 -> "1 bottle"
      true -> "#{if cap, do: "N", else: "n"}o more bottles"
    end  
  end

  defp take_down(number) do
    cond do
      number > 1 -> "Take one down and pass it around"
      number == 1 -> "Take it down and pass it around"
      true -> "Go to the store and buy some more" 
    end
  end

  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{how_many(number,true)} of beer on the wall, #{how_many(number,false)} of beer.
    #{take_down(number)}, #{how_many(number-1,false)} of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    first..last = range

    if first == last do
      verse(last)
    else
      verse(first) <> "\n" <> lyrics(first-1..last)
    end  
  end

  def lyrics() do
    lyrics(99..0)
  end
end
