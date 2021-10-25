defmodule TakeANumber do
  def start() do
    spawn(fn -> machine(0)

    end)
  end

  defp machine(state) do
    receive do
      {:report_state,sender_pid} ->
        send(sender_pid,state)
        machine(state)
      {:take_a_number, sender_pid} ->
        send(sender_pid,state+1)
        machine(state+1)
      :stop -> 0
      _ ->
        machine(state)
    end
  end
end
