# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start() do
    Agent.start(fn -> {0, []} end)
  end

  def list_registrations(pid) do
    {_, l} = Agent.get(pid, & &1)
    l
  end

  def register(pid, register_to) do
    Agent.get_and_update(
      pid,
      fn {id, list} ->
        id = id + 1

        s = %Plot{
          plot_id: id,
          registered_to: register_to
        }

        {s, {id, [s | list]}}
      end
    )
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn {id, list} ->
      {id, Enum.filter(list, & &1.plot_id != plot_id)}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn {_, list} ->
      Enum.find(list,{:not_found, "plot is unregistered"}, & &1.plot_id == plot_id)
    end)
  end
end
