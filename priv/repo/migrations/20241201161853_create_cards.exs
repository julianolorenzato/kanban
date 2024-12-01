defmodule Kanban.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :title, :string, null: false
      add :description, :string
      add :priority, :string, default: "medium"
      add :place, :string
      add :deadline, :date
      add :attachments, {:array, :string}

      add :stage_id, references(:stages, on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end
  end
end
