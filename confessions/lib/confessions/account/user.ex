defmodule Confessions.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :password, :string, virtual: true
    field :password_hash, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash()
  end
  
  defp put_pass_hash(changeset) do 
    case changeset do
    %Ecto.Changeset{valid?: true, changes: %{password: pass}} -> put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(pass))
    _ ->
      changeset
    end 
  end

end
