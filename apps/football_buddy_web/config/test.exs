use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :football_buddy_web, FootballBuddyWeb.Endpoint,
  http: [port: 4001],
  server: false
