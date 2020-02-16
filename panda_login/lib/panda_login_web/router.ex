defmodule PandaLoginWeb.Router do
  use PandaLoginWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug PandaLoginWeb.Auth 
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PandaLoginWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController 
    get "/panda", UserController, :panda
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PandaLoginWeb do
  #   pipe_through :api
  # end
end
