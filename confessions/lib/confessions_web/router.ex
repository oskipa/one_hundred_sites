defmodule ConfessionsWeb.Router do
  use ConfessionsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug ConfessionsWeb.Auth 
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ConfessionsWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/user", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete] 
  end

  # Other scopes may use custom stacks.
  # scope "/api", ConfessionsWeb do
  #   pipe_through :api
  # end
end
