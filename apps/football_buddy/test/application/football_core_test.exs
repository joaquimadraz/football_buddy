defmodule FootballBuddy.Test.FootballCoreTest do
  use ExUnit.Case

  alias FootballBuddy.FootballCore
  alias FootballBuddy.FootballCore.Competition

  defmodule SourceErrorMock do
    def get_competitions, do: {:error, :something}
    def get_competition("PL"), do: {:error, :something}
    def get_competition(_), do: {:error, :not_found}
  end

  defmodule SourceSuccessMock do
    def get_competitions do
      competitions = [
        %Competition{},
        %Competition{}
      ]

      {:ok, competitions}
    end

    def get_competition("PPL"), do: {:ok, %Competition{}}
  end

  describe "competitions/0" do
    test "returns error for service error" do
      assert {:error, {:service_error}} = FootballCore.competitions(SourceErrorMock)
    end

    test "returns competitions" do
      assert {:ok, competitions} = FootballCore.competitions(SourceSuccessMock)

      assert Enum.count(competitions) == 2
    end

    test "return list of Competition" do
      assert {:ok, [competition | _]} = FootballCore.competitions(SourceSuccessMock)

      assert %Competition{} = competition
    end
  end

  describe "competition" do
    test "returns error for service error" do
      assert {:error, {:service_error}} = FootballCore.competition("PL", SourceErrorMock)
    end

    test "returns a competition" do
      assert {:ok, competition} = FootballCore.competition("PPL", SourceSuccessMock)

      assert %Competition{} = competition
    end

    test "returns error for unknown competition" do
      assert {:error, :unknown} = FootballCore.competition("UNK", SourceErrorMock)
    end
  end
end

