# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :vox_populi,
  ecto_repos: [VoxPopuli.Repo]

# Configures the endpoint
config :vox_populi, VoxPopuliWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PJaFduYsk5QZ2+yRgjKOILi1u+mCe+TIWn0C6TpL5dhSuQ0GdalnOKdM3y7wD6tk",
  render_errors: [view: VoxPopuliWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: VoxPopuli.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
