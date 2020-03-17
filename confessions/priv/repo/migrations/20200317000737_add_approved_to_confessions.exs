defmodule Confessions.Repo.Migrations.AddApprovedToConfessions do
  use Ecto.Migration

  def change do
    alter table(:confessions) do
      add :approved, :boolean
    end
  end
end
