defmodule MetaitoApi.ResourcesTest do
  use MetaitoApi.DataCase

  alias MetaitoApi.Resources

  describe "notes" do
    alias MetaitoApi.Resources.Note

    @valid_attrs %{text: "some text", title: "some title"}
    @update_attrs %{text: "some updated text", title: "some updated title"}
    @invalid_attrs %{text: nil, title: nil}

    def note_fixture(attrs \\ %{}) do
      {:ok, note} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Resources.create_note()

      note
    end

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert Resources.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert Resources.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      assert {:ok, %Note{} = note} = Resources.create_note(@valid_attrs)
      assert note.text == "some text"
      assert note.title == "some title"
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Resources.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      assert {:ok, %Note{} = note} = Resources.update_note(note, @update_attrs)
      assert note.text == "some updated text"
      assert note.title == "some updated title"
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = Resources.update_note(note, @invalid_attrs)
      assert note == Resources.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = Resources.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> Resources.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = Resources.change_note(note)
    end
  end
end
