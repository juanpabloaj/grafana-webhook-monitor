defmodule GrafanawebhookWeb.ApiController do
  use GrafanawebhookWeb, :controller

  alias Grafanawebhook.Dashboard

  def index(conn, _params) do
    Dashboard.create_message(conn.params)

    json conn, %{message: "info received ok"}
  end
end
