defmodule GrafanawebhookWeb.DashboardController do
  use GrafanawebhookWeb, :controller

  def index(conn, _params) do
    Phoenix.LiveView.Controller.live_render(
      conn,
      GrafanawebhookWeb.Live.Index,
      session: %{}
    )
  end
end
