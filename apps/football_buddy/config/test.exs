use Mix.Config

# Configure your database
config :football_buddy, FootballBuddy.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "football_buddy_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
