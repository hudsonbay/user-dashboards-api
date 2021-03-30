defmodule MetaitoApi.Resources.Note do
  use Ecto.Schema
  import Ecto.Changeset

  alias MetaitoApi.Accounts.User

  schema "notes" do
    field :text, :string
    field :title, :string

    belongs_to(:user, User)


    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:title, :text, :user_id])
    |> validate_required([:title, :text, :user_id])
    |> assoc_constraint(:user)
  end
end
