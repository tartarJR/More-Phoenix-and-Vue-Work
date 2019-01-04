defmodule FindmealotWeb.Router do
  use FindmealotWeb, :router

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

  scope "/", FindmealotWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", FindmealotWeb do
  #   pipe_through :api
  # end

  scope "/api", FindmealotWeb do
    pipe_through :api

    post "/lots", LotApiController, :findLots
  end

end
