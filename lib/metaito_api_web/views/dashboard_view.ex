defmodule MetaitoApiWeb.DashboardView do
  use MetaitoApiWeb, :view
  alias MetaitoApiWeb.{DashboardView, LinkView, NoteView}

  def render("index.json", %{dashboards: dashboards}) do
    %{data: render_many(dashboards, DashboardView, "dashboard.json")}
  end

  def render("show.json", %{dashboard: dashboard}) do
    %{data: render_one(dashboard, DashboardView, "dashboard.json")}
  end

  def render("dashboard.json", %{dashboard: dashboard}) do
    %{
      id: dashboard.id,
      title: dashboard.title,
      links: render_many(dashboard.links, LinkView, "link.json"),
      notes: render_many(dashboard.notes, NoteView, "note.json")
    }
  end
end
