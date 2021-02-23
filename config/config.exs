# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_discuss,
  ecto_repos: [PhoenixDiscuss.Repo]

# Configures the endpoint
config :phoenix_discuss, PhoenixDiscussWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "f++axkAm9iYW6sWW8vLKjnPRFGcWmu5YOYQ0r1dEfezVo5m11NxPVzp/rMHdVHl6",
  render_errors: [view: PhoenixDiscussWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhoenixDiscuss.PubSub,
  live_view: [signing_salt: "DWu4+yLD"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
