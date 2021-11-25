defmodule UuidAppWeb.PageController do
  use UuidAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
