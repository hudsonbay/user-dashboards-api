defmodule MetaitoApiWeb.UserView do
  use MetaitoApiWeb, :view

  alias MetaitoApiWeb.{UserView, NoteView, LinkView}

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user_with_resources.json")}
  end

  def render("user_with_resources.json", %{user: user}) do
    %{
        id: user.id,
        email: user.email,
        inserted_at: user.inserted_at,
        notes: render_many(user.notes, NoteView, "note.json"),
        links: render_many(user.links, LinkView, "link.json")
    }
  end

end
