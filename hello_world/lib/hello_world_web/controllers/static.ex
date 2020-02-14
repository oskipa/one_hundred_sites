defmodule HelloWorldWeb.StaticPageController do
  use HelloWorldWeb, :controller
  
  def index(conn, _params) do
    redirect conn, to: "/hello.html"
  end
end
