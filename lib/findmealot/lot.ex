defmodule Findmealot.Lot do
  use Ecto.Schema
  import Ecto.Changeset


  schema "lots" do
    field :free_lots, :integer
    field :price_per_hour, :float
    field :street_address, :string

    timestamps()
  end

  @doc false
  def changeset(lot, attrs) do
    lot
    |> cast(attrs, [:street_address, :price_per_hour, :free_lots])
    |> validate_required([:street_address, :price_per_hour, :free_lots])
  end
end
