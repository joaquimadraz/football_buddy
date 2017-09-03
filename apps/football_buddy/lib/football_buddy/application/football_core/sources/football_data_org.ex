defmodule FootballBuddy.FootballCore.Sources.FootballDataOrg do
  @football_data_org_url "https://api.football-data.org"

  alias FootballBuddy.Competition
  alias FootballBuddy.Helpers.HttpClient

  def get_competitions do
    case do_get(competitions_url()) do
      {:ok, %{status_code: 200, body: body}} ->
        competitions = Enum.map(body, &parse_competition/1)

        {:ok, competitions}
      {:error, _} ->
        {:error, :service_error}
    end
  end

  def get_competition(code) do
    case do_get(competition_url(code)) do
      {:ok, %{status_code: 200, body: body}} ->
        competition = parse_competition(body)

        {:ok, competition}
      {:ok, %{status_code: 404}} ->
        {:error, :not_found}
      {:ok, %{status_code: 400}} ->
        {:error, :bad_request}
      {:error, _} ->
        {:error, :service_error}
    end
  end

  defp competitions_url, do: "#{@football_data_org_url}/v1/competitions"
  defp competition_url(code) do
    "#{@football_data_org_url}/v1/competitions/#{competition_id_by_code(code)}"
  end

  defp competition_id_by_code("PL"), do: 445
  defp competition_id_by_code("PPL"), do: 457
  defp competition_id_by_code(_), do: :unknown

  defp parse_competition(data) do
    %Competition{
      name: data["caption"],
      code: data["league"],
      year: data["year"],
      matchdays_count: data["numberOfMatchdays"],
      teams_count: data["numberOfTeams"]
    }
  end

  defp do_get(url), do: HttpClient.get(url, headers())

  defp headers do
    ["X-Response-Control": "minified"]
  end
end
