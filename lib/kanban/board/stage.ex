defmodule Kanban.Board.Stage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stages" do
    field :title, :string

    has_many :cards, Kanban.Board.Card

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(stage, attrs) do
    stage
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
