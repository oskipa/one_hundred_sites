defmodule VoxPopuli.Repo.Migrations.AddPostsTables do
  use Ecto.Migration

  def change do
    create table("posts") do
      add :author, :string
      add :content, :text

      timestamps()
    end 
  end
end
