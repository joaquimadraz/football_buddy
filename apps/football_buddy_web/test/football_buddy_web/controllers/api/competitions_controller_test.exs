defmodule FootballBuddyWeb.Api.DashboardControllerTest do
  use FootballBuddyWeb.ConnCase
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "GET /api/competitions" do
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

  describe "GET /api/competition/:code" do
    test "returns not found", %{conn: conn} do
      use_cassette "football_data_org/competition_not_found" do
        conn = get(conn, api_competition_path(conn, :show, "PPL"))
        data = json_response(conn, 200)["data"]

        assert data === %{
          "code" => "PPL",
          "matchdays_count" => 34,
          "name" => "Primeira Liga 2017/18",
          "teams_count" => 18,
          "year" => "2017"
        }
      end
    end

    test "returns PPL data", %{conn: conn} do
      use_cassette "football_data_org/competition_ppl" do
        conn = get(conn, api_competition_path(conn, :show, "XYZ"))
        assert json_response(conn, 503)
      end
    end
  end
end
