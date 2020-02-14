# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :lotto,
  ecto_repos: [Lotto.Repo]

# Configures the endpoint
config :lotto, LottoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UyUY7q0n8pudf6eK5TNFHlQ7Yu1RL9r8UdxWn4Xzdu7g2Bbpa7Xko4xi13Ts+gEM",
  render_errors: [view: LottoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Lotto.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
