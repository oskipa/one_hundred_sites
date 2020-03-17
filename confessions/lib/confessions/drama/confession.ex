defmodule Confessions.Drama.Confession do
  use Ecto.Schema
  import Ecto.Changeset

  schema "confessions" do
    field :content, :string
    field :approved, :boolean

    timestamps()
  end

  @doc false
  def changeset(confession, attrs) do
    confession
    |> cast(attrs, [:content, :approved])
    |> validate_required([:content])
  end
end
