defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)

    number ==
      Enum.reduce(digits,0,fn x,acc ->
        acc + round(:math.pow(x,length(digits)))
      end)
  end
end
