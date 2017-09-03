defmodule FootballBuddyWeb.Api.CompetitionController do
  use FootballBuddyWeb, :controller

  def index(conn, _params) do
    case FootballBuddy.get_competitions() do
      {:ok, competitions} ->
        conn
        |> put_status(:ok)
        |> render("index.json", competitions: competitions)
    end
  end
end
