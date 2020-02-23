defmodule ConfessionsWeb.PageController do
  use ConfessionsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
