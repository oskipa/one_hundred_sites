defmodule VoxPopuliWeb.PageController do
  use VoxPopuliWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
