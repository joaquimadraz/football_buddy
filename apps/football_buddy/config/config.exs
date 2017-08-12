use Mix.Config

config :football_buddy, ecto_repos: [FootballBuddy.Repo]

import_config "#{Mix.env}.exs"
