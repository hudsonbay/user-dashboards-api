defmodule MetaitoApi.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :title, :string
      add :url, :string
      add :dashboard_id, references(:dashboards, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:links, [:dashboard_id])
  end
end
