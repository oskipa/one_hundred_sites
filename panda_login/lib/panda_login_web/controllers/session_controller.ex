defmodule PandaLoginWeb.SessionController do 
  use PandaLoginWeb, :controller
  
  def new(conn, _) do 
    render(conn, "new.html")
  end

  def create( conn, %{"session" => %{"username" => username, "password" => pass}} ) do
    case PandaLogin.Account.authenticate_by_username_and_password(username, pass) do 
      {:ok, user} ->
        conn
          |> PandaLoginWeb.Auth.login(user)
          |> put_flash(:info, "Welcome back!")
          |> redirect(to: Routes.user_path(conn, :panda))
      {:error, _reason} -> 
          conn
          |> put_flash(:error, "Invalid username/password combination")
          |> render("new.html") 
    end
  end

  def delete(conn, _) do 
    conn
    |> PandaLoginWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index)) 
  end
 end
