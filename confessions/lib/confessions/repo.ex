defmodule Confessions.Repo do
  use Ecto.Repo,
    otp_app: :confessions,
    adapter: Ecto.Adapters.Postgres
end
