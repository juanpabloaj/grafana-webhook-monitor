defmodule GrafanawebhookWeb.Router do
  use GrafanawebhookWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GrafanawebhookWeb do
    pipe_through :browser # Use the default browser stack

    get "/", DashboardController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", GrafanawebhookWeb do
    pipe_through :api

    get "/", ApiController, :index
    post "/", ApiController, :index
  end
end
