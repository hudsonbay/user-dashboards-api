defmodule MetaitoApi.Resources.Link do
  use Ecto.Schema
  import Ecto.Changeset

  alias MetaitoApi.Profile.Dashboard

  schema "links" do
    field :title, :string
    field :url, EctoFields.URL

    belongs_to(:dashboard, Dashboard)

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:title, :url, :dashboard_id])
    |> validate_required([:title, :url, :dashboard_id])
    |> assoc_constraint(:dashboard)
  end
end
