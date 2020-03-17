defmodule ConfessionsWeb.ConfessionController do
  use ConfessionsWeb, :controller

  alias Confessions.Drama
  alias Confessions.Drama.Confession

  def index(conn, _params) do
    confessions = Drama.list_confessions()
    render(conn, "index.html", confessions: confessions)
  end

  def new(conn, _params) do
    changeset = Drama.change_confession(%Confession{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"confession" => confession_params}) do
    case Drama.create_confession(confession_params) do
      {:ok, confession} ->
        conn
        |> put_flash(:info, "Confession created successfully.")
        |> redirect(to: Routes.confession_path(conn, :show, confession))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    confession = Drama.get_confession!(id)
    render(conn, "show.html", confession: confession)
  end

  def edit(conn, %{"id" => id}) do
    confession = Drama.get_confession!(id)
    changeset = Drama.change_confession(confession)
    render(conn, "edit.html", confession: confession, changeset: changeset)
  end

  def update(conn, %{"id" => id, "confession" => confession_params}) do
    confession = Drama.get_confession!(id)

    case Drama.update_confession(confession, confession_params) do
      {:ok, confession} ->
        conn
        |> put_flash(:info, "Confession updated successfully.")
        |> redirect(to: Routes.confession_path(conn, :show, confession))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", confession: confession, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    confession = Drama.get_confession!(id)
    {:ok, _confession} = Drama.delete_confession(confession)

    conn
    |> put_flash(:info, "Confession deleted successfully.")
    |> redirect(to: Routes.confession_path(conn, :index))
  end
end
