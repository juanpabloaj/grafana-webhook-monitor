defmodule Grafanawebhook.Dashboard do
  @moduledoc """
  The Dashboard context.
  """

  alias Grafanawebhook.Repo
  #alias Grafanawebhook.Dashboard.Message

  @topic inspect(__MODULE__)

  def subscribe do
    Phoenix.PubSub.subscribe(Grafanawebhook.PubSub, @topic)
  end

  @doc """
  Returns the list of messages.

  ## Examples

      iex> list_messages()
      [%Message{}, ...]

  """
  def list_messages do
    Repo.get_all()
  end

  @doc """
  Creates a message.

  ## Examples

      iex> create_message(%{field: value})
      {:ok, %Message{}}

      iex> create_message(%{field: bad_value})
      {:error, ...}

  """
  def create_message(attrs \\ %{}) do
    Repo.put(attrs)
    {:ok, %{}}
    |> notify_subs([:message, :inserted])
  end

  defp notify_subs({:ok, result}, event) do
    Phoenix.PubSub.broadcast(Grafanawebhook.PubSub, @topic, {__MODULE__, event, result})
    {:ok, result}
  end

  defp notify_subs({:error, reason}, _event) do
    {:error, reason}
  end

end
