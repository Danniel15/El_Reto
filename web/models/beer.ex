defmodule El_Reto.Beer do
  use El_Reto.Web, :model

  schema "beers" do
    field :name, :string
    field :date, Ecto.Date
    field :ingredients, :string
    field :type, :string
    field :volume, :integer

    timestamps
  end

  @required_fields ~w(name date ingredients type volume)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_unique(:name, on: El_Reto.Repo)
  end
end
