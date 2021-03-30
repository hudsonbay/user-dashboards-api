defmodule MetaitoApi.Resources.Link do
  use Ecto.Schema
  import Ecto.Changeset

  alias MetaitoApi.Accounts.User

  schema "links" do
    field :title, :string
    field :url, EctoFields.URL

    belongs_to(:user, User)

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:title, :url, :user_id])
    |> validate_required([:title, :url, :user_id])
    |> assoc_constraint(:user)
  end
end
