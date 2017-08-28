defmodule FootballBuddy.FootballCore do
  alias FootballBuddy.FootballCore.Sources.FootballDataOrg

  @default_source FootballDataOrg

  def competitions(source \\ @default_source) do
    case source.get_competitions do
      {:ok, competitions} -> {:ok, competitions}
      _ -> {:error, {:service_error}}
    end
  end

  def competition(code, source \\ @default_source) do
    case source.get_competition(code) do
      {:ok, competition} -> {:ok, competition}
      {:error, :not_found} -> {:error, :unknown}
      _ -> {:error, {:service_error}}
    end
  end
end
