defmodule MetaitoApi.Resources.Note do
  use Ecto.Schema
  import Ecto.Changeset

  alias MetaitoApi.Profile.Dashboard

  schema "notes" do
    field :text, :string
    field :title, :string

    belongs_to(:dashboard, Dashboard)

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:title, :text, :dashboard_id])
    |> validate_required([:title, :text, :dashboard_id])
    |> assoc_constraint(:dashboard)
  end
end
