defmodule ConfessionsWeb.SessionController do
  use ConfessionsWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"username" => username, "password" => pass}}) do
    case Confessions.Account.authenticate_by_username_and_password(username, pass) do
      {:ok, user} ->
        conn
        |> ConfessionsWeb.Auth.login(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.user_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid username/password combination")  
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> ConfessionsWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
  
end
