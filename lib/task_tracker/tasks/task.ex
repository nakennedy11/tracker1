defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :description, :string
    field :time, :integer
    field :title, :string
    belongs_to :user, TaskTracker.Users.User
    field :complete, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    
    task
    |> cast(attrs, [:title, :description, :time, :complete])
    |> validate_required([:title, :description, :time, :complete])
    |> incfifteen(:time)
    #|> valid_user(:user_id)
  end

  def incfifteen(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, time ->
      case rem(time, 15) == 0 do
	true -> []
	false -> [{field, options[:message] || "Must enter time in increments of 15"}]
      end
    end)
  end

  def valid_user(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, user_id ->
      case TaskTracker.Users.get_user!(user_id) do
	true -> []
	false -> [{field, options[:message] || "Must enter a valid user"}]
      end
    end)
  end	
end
