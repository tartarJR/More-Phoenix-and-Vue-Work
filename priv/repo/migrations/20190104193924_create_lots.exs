defmodule Findmealot.Repo.Migrations.CreateLots do
  use Ecto.Migration

  def change do
    create table(:lots) do
      add :street_address, :string
      add :price_per_hour, :float
      add :free_lots, :integer

      timestamps()
    end

  end
end
