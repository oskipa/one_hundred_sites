defmodule PandaLogin.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :password, :string, virtual: true
    field :hash_password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :hash_password])
    |> validate_required([:username, :password])
  end

  @doc """
  Creates registration changeset

  ## Examples

  """
  def registration_changeset(user, params \\ %{}) do
    user
    |> changeset(params)
    |> cast(params, [:password])
    |> validate_required([:password])
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do 
    case changeset do
    %Ecto.Changeset{valid?: true, changes: %{password: pass}} -> put_change(changeset, :hash_password, Pbkdf2.hash_pwd_salt(pass))
    _ ->
      changeset
    end 
  end
end
