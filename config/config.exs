# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :findmealot,
  ecto_repos: [Findmealot.Repo]

# Configures the endpoint
config :findmealot, FindmealotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UjT7ZEDrbXXra7ivfifYtP93oRDMXqiHyxZFB16m9sOAp8qrhjJf5yIfytpbK51F",
  render_errors: [view: FindmealotWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Findmealot.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
