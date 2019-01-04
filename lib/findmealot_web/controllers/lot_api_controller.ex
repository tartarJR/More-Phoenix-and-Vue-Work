defmodule FindmealotWeb.LotApiController do
  use FindmealotWeb, :controller

  alias Findmealot.Repo
  alias Findmealot.Lot

  def findLots(conn, _params) do
    lots = Repo.all(Lot)
    |> Enum.map(fn(lot) ->
      %{
        street_address: lot.street_address,
        price_per_hour: lot.price_per_hour,
        free_lots: lot.free_lots
      }
    end)

    conn
    |> json(%{lots: lots})
  end

end
