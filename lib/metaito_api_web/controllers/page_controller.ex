defmodule MetaitoApiWeb.PageController do
  use MetaitoApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
