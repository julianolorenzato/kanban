defmodule KanbanWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types Absinthe.Type.Custom

  object :card do
    field :id, non_null(:id)
  end

  query do
    field :get_card, :card do
      arg :id, non_null(:id)

      resolve fn %{id: id}, _ -> {:ok, %{id: id}} end
    end
  end
end
