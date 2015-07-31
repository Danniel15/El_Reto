defmodule El_Reto.BeerView do
  use El_Reto.Web, :view

  def render("index.json", %{beers: beers}) do
    beers
  end

end
