defmodule LottoWeb.PageController do
  use LottoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
