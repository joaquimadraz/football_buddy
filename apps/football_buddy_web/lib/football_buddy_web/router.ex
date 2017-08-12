defmodule FootballBuddyWeb.Router do
  use FootballBuddyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FootballBuddyWeb do
    pipe_through :api
  end
end
