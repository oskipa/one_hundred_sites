defmodule PandaLoginWeb.PageController do
  use PandaLoginWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
