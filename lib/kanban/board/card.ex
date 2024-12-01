defmodule Kanban.Board.Card do
  use Ecto.Schema

  schema "card" do
    field :title, :string
    field :description, :string
  end
end
