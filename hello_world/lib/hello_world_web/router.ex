defmodule HelloWorldWeb.Router do
  use HelloWorldWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HelloWorldWeb do
    pipe_through :api
  end

  pipeline :browser do
  end

  scope "/", HelloWorldWeb do
    get "/", StaticPageController, :index
  end

 end
