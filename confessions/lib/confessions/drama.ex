defmodule Confessions.Drama do
  @moduledoc """
  The Drama context.
  """

  import Ecto.Query, warn: false
  alias Confessions.Repo

  alias Confessions.Drama.Confession

  @doc """
  Returns the list of confessions.

  ## Examples

      iex> list_confessions()
      [%Confession{}, ...]

  """
  def list_confessions do
    Repo.all(Confession)
  end

  @doc """
  Gets a single confession.

  Raises `Ecto.NoResultsError` if the Confession does not exist.

  ## Examples

      iex> get_confession!(123)
      %Confession{}

      iex> get_confession!(456)
      ** (Ecto.NoResultsError)

  """
  def get_confession!(id), do: Repo.get!(Confession, id)

  @doc """
  Creates a confession.

  ## Examples

      iex> create_confession(%{field: value})
      {:ok, %Confession{}}

      iex> create_confession(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_confession(attrs \\ %{}) do
    %Confession{}
    |> Confession.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a confession.

  ## Examples

      iex> update_confession(confession, %{field: new_value})
      {:ok, %Confession{}}

      iex> update_confession(confession, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_confession(%Confession{} = confession, attrs) do
    confession
    |> Confession.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a confession.

  ## Examples

      iex> delete_confession(confession)
      {:ok, %Confession{}}

      iex> delete_confession(confession)
      {:error, %Ecto.Changeset{}}

  """
  def delete_confession(%Confession{} = confession) do
    Repo.delete(confession)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking confession changes.

  ## Examples

      iex> change_confession(confession)
      %Ecto.Changeset{source: %Confession{}}

  """
  def change_confession(%Confession{} = confession) do
    Confession.changeset(confession, %{})
  end
end
