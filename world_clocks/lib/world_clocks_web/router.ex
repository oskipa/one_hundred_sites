defmodule WorldClocksWeb.Router do
  use WorldClocksWeb, :router
  import  Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Phoenix.LiveView.Flash
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WorldClocksWeb do
    pipe_through :browser

    live "/clocks", TimeLive, session: %{"country_name" => "default"}

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", WorldClocksWeb do
  #   pipe_through :api
  # end
end
