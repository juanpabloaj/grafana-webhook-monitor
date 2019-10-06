defmodule Grafanawebhook.Repo do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(state) do
    {:ok, state}
  end

  def put(data) do
    GenServer.cast(__MODULE__, {:put, data})
  end

  def get_all() do
    GenServer.call(__MODULE__, {:get_all})
  end

  def handle_call({:get_all}, _from, state) do
    {:reply, Enum.reverse(state), state}
  end

  def handle_cast({:put, data}, state) do
    data = Map.put(data, "created_at", inspect(System.system_time(:millisecond)))

    state = case length(state) >= 10 do
      true -> tl(state)
      _ -> state
    end

    {:noreply, state ++ [data]}
  end

end
