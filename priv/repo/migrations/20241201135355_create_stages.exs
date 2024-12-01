defmodule Kanban.Repo.Migrations.CreateStages do
  use Ecto.Migration

  def change do
    create table(:stages) do
      add :title, :string, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
