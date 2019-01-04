# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Findmealot.Repo.insert!(%Findmealot.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Findmealot.{Repo, Lot}

[
  %{street_address: "Turu 2", price_per_hour: 0.1, free_lots: 12},
  %{street_address: "Raatuse 22", price_per_hour: 0.2, free_lots: 11},
  %{street_address: "Narva 25", price_per_hour: 0.3, free_lots: 15},
  %{street_address: "Narva 27", price_per_hour: 0.4, free_lots: 9},
  %{street_address: "Ülikooli 17", price_per_hour: 0.5, free_lots: 20}
 ]
 |> Enum.each(fn lot -> Repo.insert!(Lot.changeset(%Lot{}, %{free_lots: lot.free_lots, price_per_hour: lot.price_per_hour, street_address: lot.street_address})) end)


