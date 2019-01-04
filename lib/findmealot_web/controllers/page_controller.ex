defmodule FindmealotWeb.PageController do
  use FindmealotWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
