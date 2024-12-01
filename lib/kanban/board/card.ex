defmodule Kanban.Board.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :description, :string
    field :title, :string
    field :priority, Ecto.Enum, values: [:low, :medium, :high], default: :medium
    field :place, :string
    field :deadline, :date
    field :attachments, {:array, :string}

    belongs_to :stage, Kanban.Board.Stage

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
