defmodule Findmealot.Repo do
  use Ecto.Repo,
    otp_app: :findmealot,
    adapter: Ecto.Adapters.Postgres
end
