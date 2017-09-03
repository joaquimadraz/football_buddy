defmodule FootballBuddyWeb.Router do
  use FootballBuddyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/api", FootballBuddyWeb, as: :api do
    pipe_through :api

    resources "/competitions", Api.CompetitionController, param: "code",
                                                          only: [:index, :show]
  end

  scope "/", FootballBuddyWeb do
    pipe_through :browser

    get "/", PageController, :index
  end
end
