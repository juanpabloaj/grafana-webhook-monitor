defmodule Grafanawebhook.Repo do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(state) do
    {:ok, state}
  end

  def put(data) do
    IO.inspect data
    GenServer.cast(__MODULE__, {:put, data})
  end

  def get_all() do
    GenServer.call(__MODULE__, {:get_all})
  end

  def handle_call({:get_all}, _from, state) do
    #IO.inspect state
    {:reply, state, state}
  end

  def handle_cast({:put, data}, state) do
    state = state ++ [data]
    {:noreply, state}
  end

end
