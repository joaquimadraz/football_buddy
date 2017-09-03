defmodule FootballBuddy do
  alias FootballBuddy.FootballCore

  @moduledoc false

  def get_competitions, do: FootballCore.competitions()
end
