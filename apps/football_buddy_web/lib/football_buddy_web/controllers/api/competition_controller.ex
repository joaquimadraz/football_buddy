defmodule FootballBuddyWeb.Api.CompetitionController do
  use FootballBuddyWeb, :controller
  alias FootballBuddyWeb.ErrorView

  def index(conn, _params) do
    case FootballBuddy.get_competitions() do
      {:ok, competitions} ->
        conn
        |> put_status(200)
        |> render("index.json", competitions: competitions)
    end
  end

  def show(conn, params) do
    case FootballBuddy.get_competition(params["code"]) do
      {:ok, competition} ->
        conn
        |> put_status(200)
        |> render("show.json", competition: competition)
      {:error, _reason} ->
        conn
        |> put_status(503)
        |> render(ErrorView, :"503")
    end
  end
end
