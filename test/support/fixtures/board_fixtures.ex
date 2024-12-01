defmodule Kanban.BoardFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kanban.Board` context.
  """

  @doc """
  Generate a card.
  """
  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> Kanban.Board.create_card()

    card
  end

  @doc """
  Generate a stage.
  """
  def stage_fixture(attrs \\ %{}) do
    {:ok, stage} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Kanban.Board.create_stage()

    stage
  end
end
