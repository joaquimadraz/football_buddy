defmodule FootballBuddy.FootballCore.Sources.FootballDataOrg do
  @football_data_org_url "https://api.football-data.org"

  def get_competitions do
    case HTTPoison.get(@football_data_org_url <> "/v1/competitions", headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Poison.decode!(body)}
      {:error, %HTTPoison.Error{}} ->
        {:error, :service_error}
    end
  end

  defp headers do
    ["X-Response-Control": "minified"]
  end
end
