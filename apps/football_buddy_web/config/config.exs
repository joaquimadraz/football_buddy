# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :football_buddy_web,
  namespace: FootballBuddyWeb,
  ecto_repos: [FootballBuddy.Repo]

# Configures the endpoint
config :football_buddy_web, FootballBuddyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RPMr4CkkSx1HYhEihHMiYwvmcq1Sj1g4Ij4gNFrmkqtI3VOlD0I1CNEEHVfyYBXs",
  render_errors: [view: FootballBuddyWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: FootballBuddyWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :football_buddy_web, :generators,
  context_app: :football_buddy

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
