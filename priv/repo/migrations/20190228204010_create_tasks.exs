defmodule TaskTracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, null: false
      add :description, :string
      add :time, :integer
      add :user_id, :string
      
      timestamps()
    end
  end
end
