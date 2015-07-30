defmodule El_Reto.BeerControllerTest do
  use El_Reto.ConnCase

  alias El_Reto.Beer
  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, ingredients: "some content", name: "some content", type: "some content", volume: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, beer_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing beers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, beer_path(conn, :new)
    assert html_response(conn, 200) =~ "New beer"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, beer_path(conn, :create), beer: @valid_attrs
    assert redirected_to(conn) == beer_path(conn, :index)
    assert Repo.get_by(Beer, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, beer_path(conn, :create), beer: @invalid_attrs
    assert html_response(conn, 200) =~ "New beer"
  end

  test "shows chosen resource", %{conn: conn} do
    beer = Repo.insert! %Beer{}
    conn = get conn, beer_path(conn, :show, beer)
    assert html_response(conn, 200) =~ "Show beer"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, beer_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    beer = Repo.insert! %Beer{}
    conn = get conn, beer_path(conn, :edit, beer)
    assert html_response(conn, 200) =~ "Edit beer"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    beer = Repo.insert! %Beer{}
    conn = put conn, beer_path(conn, :update, beer), beer: @valid_attrs
    assert redirected_to(conn) == beer_path(conn, :show, beer)
    assert Repo.get_by(Beer, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    beer = Repo.insert! %Beer{}
    conn = put conn, beer_path(conn, :update, beer), beer: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit beer"
  end

  test "deletes chosen resource", %{conn: conn} do
    beer = Repo.insert! %Beer{}
    conn = delete conn, beer_path(conn, :delete, beer)
    assert redirected_to(conn) == beer_path(conn, :index)
    refute Repo.get(Beer, beer.id)
  end
end
