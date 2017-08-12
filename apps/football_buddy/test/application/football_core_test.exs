defmodule FootballBuddy.Test.FootballCoreTest do
  use ExUnit.Case

  alias FootballBuddy.FootballCore
  alias FootballBuddy.FootballCore.Competition

  defmodule SourceErrorMock do
    def get_competitions, do: {:error, :something}
  end

  defmodule SourceSuccessMock do
    def get_competitions do
      competitions = [
        %{
          "name": "Premier League 2017/18",
          "code": "PL",
          "year": 2017,
          "matchdays_count": 38,
          "teams_count": 20,
        },
        %{
          "name": "Primeira Liga 2017/18",
          "code": "PPL",
          "year": 2017,
          "matchdays_count": 34,
          "teams_count": 18,
        }
      ]

      {:ok, competitions}
    end
  end

  describe "competitions" do
    test "returns error for service error" do
      assert {:error, {:service_error}} = FootballCore.competitions(SourceErrorMock)
    end

    test "returns competitions" do
      {:ok, competitions} = FootballCore.competitions(SourceSuccessMock)

      assert Enum.count(competitions) == 2
    end

    test "return list of Competition" do
      {:ok, [competition | _]} = FootballCore.competitions(SourceSuccessMock)

      assert %Competition{} = competition
    end
  end
end

