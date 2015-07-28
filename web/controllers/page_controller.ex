defmodule El_Reto.PageController do
  use El_Reto.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
