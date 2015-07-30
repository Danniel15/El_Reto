defmodule El_Reto.Repo.Migrations.CreateBeer do
  use Ecto.Migration

  def change do
    create table(:beers) do
      add :name, :string
      add :date, :date
      add :ingredients, :string
      add :type, :string
      add :volume, :integer

      timestamps
    end

  end
end
