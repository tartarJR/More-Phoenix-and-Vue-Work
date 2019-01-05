defmodule FindmealotWeb.LotApiController do
  use FindmealotWeb, :controller

  import Ecto.Query
  alias Findmealot.Repo
  alias Findmealot.Lot

  def findLots(conn, _params) do

    lots = Repo.all(from t in Lot, where: t.free_lots > 0, select: t)
    |> Enum.map(fn(lot) ->
      %{
        id: lot.id,
        street_address: lot.street_address,
        price_per_hour: lot.price_per_hour,
        free_lots: lot.free_lots,
        distance: :null
      }
    end)

    conn
    |> json(%{lots: lots})
  end

end
