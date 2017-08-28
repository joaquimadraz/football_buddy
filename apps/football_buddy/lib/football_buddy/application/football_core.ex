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

  defp parse_competitions(data) do
    Enum.map(data, &parse_competition/1)
  end

  defp parse_competition(data) do
    Competition.build(data)
  end
end
