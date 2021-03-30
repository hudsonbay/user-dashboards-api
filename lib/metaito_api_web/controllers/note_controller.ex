defmodule MetaitoApiWeb.NoteController do
  use MetaitoApiWeb, :controller

  alias MetaitoApi.Resources
  alias MetaitoApi.Resources.Note

  action_fallback MetaitoApiWeb.FallbackController

  def index(conn, _params) do
    notes = Resources.list_notes()
    render(conn, "index.json", notes: notes)
  end

  def create(conn, %{"note" => note_params}) do
    with {:ok, %Note{} = note} <- Resources.create_note(note_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.note_path(conn, :show, note))
      |> render("show.json", note: note)
    end
  end

  def show(conn, %{"id" => id}) do
    note = Resources.get_note!(id)
    render(conn, "show.json", note: note)
  end

  def update(conn, %{"id" => id, "note" => note_params}) do
    note = Resources.get_note!(id)

    with {:ok, %Note{} = note} <- Resources.update_note(note, note_params) do
      render(conn, "show.json", note: note)
    end
  end

  def delete(conn, %{"id" => id}) do
    note = Resources.get_note!(id)

    with {:ok, %Note{}} <- Resources.delete_note(note) do
      send_resp(conn, :no_content, "")
    end
  end
end
