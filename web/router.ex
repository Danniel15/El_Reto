defmodule El_Reto.Router do
  use El_Reto.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", El_Reto do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    
    resources "/beers", BeerController
  end

  # Other scopes may use custom stacks.
  # scope "/api", El_Reto do
  #   pipe_through :api
  # end
end
