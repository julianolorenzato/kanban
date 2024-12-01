defmodule KanbanWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types Absinthe.Type.Custom

  object :card do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :description, :string
    field :priority, :string
  end

  object :stage do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :cards, non_null(list_of(:card))
  end

  query do
    field :get_card, :card do
      arg :id, non_null(:id)

      resolve fn %{id: id}, _ -> {:ok, %{id: id}} end
    end
  end
end
