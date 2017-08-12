defmodule FootballBuddy.Application do
  @moduledoc """
  The FootballBuddy Application Service.

  The football_buddy system business domain lives in this application.

  Exposes API to clients such as the `FootballBuddyWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(FootballBuddy.Repo, []),
    ], strategy: :one_for_one, name: FootballBuddy.Supervisor)
  end
end
