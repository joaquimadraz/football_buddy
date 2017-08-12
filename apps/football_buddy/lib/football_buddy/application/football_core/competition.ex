defmodule FootballBuddy.FootballCore.Competition do
  defstruct [:name,
             :code,
             :year,
             :matchdays_count,
             :teams_count]

  def build(data) do
    %__MODULE__{
      name: data["name"],
      code: data["code"],
      year: data["year"],
      matchdays_count: data["matchdays_count"],
      teams_count: data["teams_count"]
    }
  end
end
