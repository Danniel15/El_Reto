defmodule El_Reto.BeerTest do
  use El_Reto.ModelCase

  alias El_Reto.Beer

  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, ingredients: "some content", name: "some content", type: "some content", volume: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Beer.changeset(%Beer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Beer.changeset(%Beer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
