defmodule FootballBuddy.Test.FootballCore.Sources.FootballDataOrgTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias FootballBuddy.FootballCore.Competition
  alias FootballBuddy.FootballCore.Sources.FootballDataOrg

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixture/vcr_cassettes")
    :ok
  end

  test "get competitions" do
    use_cassette "competitions" do
      assert {:ok, [competition | _]} = FootballDataOrg.get_competitions()

      assert %Competition{} = competition
      assert competition.name == "Campeonato Brasileiro da Série A"
      assert competition.code == "BSA"
      assert competition.matchdays_count == 38
      assert competition.teams_count == 20
      assert competition.year == "2017"
    end
  end
end
