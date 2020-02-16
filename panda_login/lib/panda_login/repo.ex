defmodule PandaLogin.Repo do
  use Ecto.Repo,
    otp_app: :panda_login,
    adapter: Ecto.Adapters.Postgres
end
