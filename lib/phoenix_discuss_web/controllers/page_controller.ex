defmodule PhoenixDiscussWeb.PageController do
  use PhoenixDiscussWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
