defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}

  def convert(_, _, output_base) when output_base < 2, do: {:error, "output base must be >= 2"}
  def convert(_, input_base, _) when input_base < 2, do: {:error, "input base must be >= 2"}
  def convert(digits, input_base, output_base) do
    if Enum.find_value(digits, fn x -> x < 0 or x >= input_base end) do
      {:error, "all digits must be >= 0 and < input base"}
    else
      {x, _} =
        Enum.reverse(digits)
        |> Enum.reduce({0,0},fn x,{y,z} ->
          {y + x * round(:math.pow(input_base,z)) ,z + 1}
        end)

      {:ok, conv(x,output_base,[])}
    end
  end

  defp conv(0,_,[]), do: [0]
  defp conv(0,_,list), do: list
  defp conv(v, b, list) do
    conv(div(v, b), b, [rem(v, b)| list])
  end
end
