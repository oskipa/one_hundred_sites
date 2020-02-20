defmodule WorldClocksWeb.PageController do
  use WorldClocksWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
