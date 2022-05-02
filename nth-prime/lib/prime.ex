defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count < 1 do
    raise "There's no zeroth prime"
  end

  def nth(count) do
    do_nth(2, 0, count)
  end

  defp do_nth(to_test, prime_count, count) when prime_count == count, do: to_test - 1;

  defp do_nth(to_test, prime_count, count) do
    if prime?(to_test) do
      do_nth(to_test + 1,prime_count + 1, count)
    else
      do_nth(to_test + 1,prime_count, count)
    end
  end

  defp prime?(x) when x < 4, do: true

  defp prime?(x) do
    not test_div(2,x)
  end

  defp test_div(div, x) when div < x do
    if rem(x, div) == 0 do
      true
    else
      test_div(div + 1, x)
    end
  end

  defp test_div(_div, _x) do
    false
  end

end
