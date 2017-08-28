defmodule FootballBuddy.Test.FootballCore.Sources.FootballDataOrgTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias FootballBuddy.FootballCore.Sources.FootballDataOrg

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixture/vcr_cassettes")
    :ok
  end

  test "get competitions" do
    use_cassette "competitions" do
      assert {:ok, [competition | _]} = FootballDataOrg.get_competitions()

      assert competition == %{
        "caption" => "Campeonato Brasileiro da Série A",
        "currentMatchday" => 20,
        "id" => 444,
        "lastUpdated" => "2017-08-24T00:40:05Z",
        "league" => "BSA",
        "numberOfGames" => 380,
        "numberOfMatchdays" => 38,
        "numberOfTeams" => 20,
        "year" => "2017"
      }
    end
  end
end
