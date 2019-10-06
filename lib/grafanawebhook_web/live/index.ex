defmodule GrafanawebhookWeb.Live.Index do
  use Phoenix.LiveView

  alias Grafanawebhook.Dashboard

  def mount(_session, socket) do
    if connected?(socket), do: Dashboard.subscribe()
    {:ok, fetch(socket)}
  end

  def render(assigns) do
    GrafanawebhookWeb.DashboardView.render("index.html", assigns)
  end

  def fetch(socket, user_name \\ nil) do
    assign(socket, %{
      user_name: user_name,
      messages: Dashboard.list_messages()
    })
  end
end
