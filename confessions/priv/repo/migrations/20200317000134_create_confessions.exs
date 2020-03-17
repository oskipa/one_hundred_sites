defmodule Confessions.Repo.Migrations.CreateConfessions do
  use Ecto.Migration

  def change do
    create table(:confessions) do
      add :content, :text

      timestamps()
    end

  end
end
