defmodule FootballBuddyWeb.Api.DashboardControllerTest do
  use FootballBuddyWeb.ConnCase
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  describe "GET /api/competitions" do
    setup %{conn: conn} do
      {:ok, conn: put_req_header(conn, "accept", "application/json")}
    end

    # FIXME: Add json schema test
    test "returns data", %{conn: conn} do
      use_cassette "football_data_org/competitions" do
        conn = get(conn, api_competition_path(conn, :index))
        data = json_response(conn, 200)["data"]
        first = List.first(data)

        assert first === %{
          "code" => "BSA",
          "matchdays_count" => 38,
          "name" => "Campeonato Brasileiro da Série A",
          "teams_count" => 20,
          "year" => "2017"
        }
      end
    end
  end
end
