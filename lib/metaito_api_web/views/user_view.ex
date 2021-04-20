defmodule MetaitoApiWeb.UserView do
  use MetaitoApiWeb, :view

  alias MetaitoApiWeb.{UserView, DashboardView}

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user_with_resources.json")}
  end

  def render("user_with_resources.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      inserted_at: user.inserted_at,
      dashboards: render_many(user.dashboards, DashboardView, "dashboard.json")
    }
  end
end
