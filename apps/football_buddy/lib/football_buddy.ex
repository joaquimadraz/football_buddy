defmodule FootballBuddy do
  alias FootballBuddy.FootballCore

  @moduledoc false

  def get_competitions, do: FootballCore.competitions()
  def get_competition(code), do: FootballCore.competition(code)
end
