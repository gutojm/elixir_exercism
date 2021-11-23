defmodule RPNCalculator.Exception do
  # Please implement DivisionByZeroError here.

  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  # Please implement StackUnderflowError here.

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl true
    def exception(value) do
      case value do
        [] ->
          %StackUnderflowError{}
        _ ->
          %StackUnderflowError{message: "stack underflow occurred, context: #{value}"}
      end
    end
  end

  def divide(l) when length(l) < 2, do: raise StackUnderflowError, "when dividing"
  def divide([0| _]), do: raise DivisionByZeroError
  def divide([divisor, dividendo]), do: dividendo / divisor
end
