# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :grafanawebhook, GrafanawebhookWeb.Endpoint,
  url: [host: "localhost"],
  live_view: [signing_salt: "ajHm+kAn7iCiVckdTJYBjugsVx8F7y8E"],
  secret_key_base: "a2NUoZRy3Uq6sO5nnqwSw0ydp2w9RGVTflnTrKKYdErOf3J0EE9iV3NVhVJMNOSi",
  render_errors: [view: GrafanawebhookWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Grafanawebhook.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Use Jason for JSON parsing in Phoenix and Ecto
config :phoenix, :json_library, Jason

config :phoenix, :template_engines, leex: Phoenix.LiveView.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
