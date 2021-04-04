defmodule MetaitoApi.Profile.Dashboard do
  use Ecto.Schema
  import Ecto.Changeset

  alias MetaitoApi.Accounts.User
  alias MetaitoApi.Resources.{Note, Link}

  schema "dashboards" do
    field :title, :string
    belongs_to(:user, User)

    has_many(:notes, Note, on_replace: :delete)
    has_many(:links, Link, on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(dashboard, attrs) do
    dashboard
    |> cast(attrs, [:title, :user_id])
    |> validate_required([:title, :user_id])
    |> assoc_constraint(:user)
    |> cast_assoc(:notes)
    |> cast_assoc(:links)
  end
end
