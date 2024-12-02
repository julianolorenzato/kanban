defmodule KanbanWeb.GraphQL.Schema do
  use Absinthe.Schema
  alias KanbanWeb.Graphql.Resolvers.Cards

  import_types Absinthe.Type.Custom

  object :card do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :description, :string
    field :priority, :string
    field :place, :string
    field :deadline, :date
    field :attachments, list_of(:string)
    field :stage, non_null(:stage)
  end

  object :stage do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :cards, non_null(list_of(:card))
  end

  query do
    field :list_cards, list_of(:card) do
      arg :search, :string
      arg :deadline, :date
      arg :priority, :string
      arg :place, :string
      arg :page, non_null(:integer)
      arg :page_size, non_null(:integer)

      resolve &Cards.list_cards/2
    end

    field :get_card, :card do
      arg :id, non_null(:id)

      resolve &Cards.get_card/2
    end
  end
end
