defmodule CollatzConjecture do
  require Integer

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input >= 1 do
    do_calc(input,0)
  end

  defp do_calc(1, n), do: n
  defp do_calc(input, n) do
    if Integer.is_even(input) do
      do_calc(div(input,2),n + 1)
    else
      do_calc(input * 3 + 1,n + 1)
    end
  end
end
