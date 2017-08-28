defmodule FootballBuddy.FootballCore.Sources.FootballDataOrg do
  @football_data_org_url "https://api.football-data.org"

  alias FootballBuddy.FootballCore.Competition

  def get_competitions do
    case HTTPoison.get(competitions_url, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        competitions = body |> json_response() |> Enum.map(&parse_competition/1)

        {:ok, competitions}
      {:error, %HTTPoison.Error{}} ->
        {:error, :service_error}
    end
  end

  def get_competition(code) do
    case HTTPoison.get(competition_url(code), headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        competition = body |> json_response() |> parse_competition()

        {:ok, competition}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:ok, :not_found}
      {:error, %HTTPoison.Error{}} ->
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

  defp json_response(body), do: Poison.decode!(body)

  defp parse_competition(data) do
    %Competition{
      name: data["caption"],
      code: data["league"],
      year: data["year"],
      matchdays_count: data["numberOfMatchdays"],
      teams_count: data["numberOfTeams"]
    }
  end

  defp headers do
    ["X-Response-Control": "minified"]
  end
end
