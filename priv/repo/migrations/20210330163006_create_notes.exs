defmodule MetaitoApi.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :title, :string
      add :text, :text
      add :dashboard_id, references(:dashboards, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:notes, [:dashboard_id])
  end
end
