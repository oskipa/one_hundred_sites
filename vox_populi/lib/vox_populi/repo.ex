defmodule VoxPopuli.Repo do
  use Ecto.Repo,
    otp_app: :vox_populi,
    adapter: Ecto.Adapters.Postgres
end
