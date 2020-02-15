defmodule VoxPopuliWeb.Router do
  use VoxPopuliWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", VoxPopuliWeb do
    pipe_through :browser

    get "/", PostController, :index
    get "/new", PostController, :new
    post "/", PostController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", VoxPopuliWeb do
  #   pipe_through :api
  # end
end
