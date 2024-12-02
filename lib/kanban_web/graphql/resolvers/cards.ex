defmodule KanbanWeb.Graphql.Resolvers.Cards do
  alias Kanban.Board

  def list_cards(args, _) do
    {:ok, Board.list_cards(args, args)}
  end

  def get_card(%{id: id}, _) do
    {:ok, Board.get_card!(id)}
  end
end
