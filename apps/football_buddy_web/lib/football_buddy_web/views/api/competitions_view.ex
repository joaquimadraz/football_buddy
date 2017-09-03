defmodule FootballBuddyWeb.Api.CompetitionView do
  use FootballBuddyWeb, :view
  alias FootballBuddyWeb.Api.CompetitionView

  def render("index.json", %{competitions: competitions}) do
    %{data: render_many(competitions, CompetitionView, "competition.json")}
  end
  def render("show.json", %{competition: competition}) do
    %{data: render_one(competition, CompetitionView, "competition.json")}
  end
  def render("competition.json", %{competition: competition}) do
    competition
  end
end
