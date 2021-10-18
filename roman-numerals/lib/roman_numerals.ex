defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  def to_roman(number,value,l0,l1,l2) do
    if number > 0 do
      m = div(number,value)

      cond do
        m < 4 -> String.duplicate(l0,m)
        m < 5 -> l0 <> l1
        m < 9 -> l1 <> String.duplicate(l0,m-5)
        true  -> l0 <> l2
      end  
    end  
  end

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    m = to_roman(number,1000,"M","","")   
    c = to_roman(rem(number,1000),100,"C","D","M")
    d = to_roman(rem(number,100),10,"X","L","C")
    u = to_roman(rem(number,10),1,"I","V","X")
    s = "#{m}#{c}#{d}#{u}"
  end
end
