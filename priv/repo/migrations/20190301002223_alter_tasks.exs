defmodule TaskTracker.Repo.Migrations.AlterTasks do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :complete, :boolean, default: false
    end
  end
end
