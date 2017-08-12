defmodule FootballBuddy.FootballCore do
  alias FootballBuddy.FootballCore.Competition
  alias FootballBuddy.FootballCore.Sources.FootballDataOrg

  def competitions(source \\ FootballDataOrg) do
    with {:ok, competition} <- source.get_competitions do
      {:ok, parse_competitions(competition)}
    else
      _ -> {:error, {:service_error}}
    end
  end

  ################################## PRIVATE ###################################

  defp parse_competitions(competitions) do
    Enum.map(competitions, &Competition.build/1)
  end
end
