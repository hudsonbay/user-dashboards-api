defmodule MetaitoApiWeb.NoteView do
  use MetaitoApiWeb, :view
  alias MetaitoApiWeb.NoteView

  def render("index.json", %{notes: notes}) do
    %{data: render_many(notes, NoteView, "note.json")}
  end

  def render("show.json", %{note: note}) do
    %{data: render_one(note, NoteView, "note.json")}
  end

  def render("note.json", %{note: note}) do
    %{id: note.id,
      title: note.title,
      text: note.text}
  end
end
