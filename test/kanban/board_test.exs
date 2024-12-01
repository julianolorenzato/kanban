defmodule Kanban.BoardTest do
  use Kanban.DataCase

  alias Kanban.Board

  describe "cards" do
    alias Kanban.Board.Card

    import Kanban.BoardFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Board.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Board.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Card{} = card} = Board.create_card(valid_attrs)
      assert card.description == "some description"
      assert card.title == "some title"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Board.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Card{} = card} = Board.update_card(card, update_attrs)
      assert card.description == "some updated description"
      assert card.title == "some updated title"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Board.update_card(card, @invalid_attrs)
      assert card == Board.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Board.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Board.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Board.change_card(card)
    end
  end

  describe "stages" do
    alias Kanban.Board.Stage

    import Kanban.BoardFixtures

    @invalid_attrs %{title: nil}

    test "list_stages/0 returns all stages" do
      stage = stage_fixture()
      assert Board.list_stages() == [stage]
    end

    test "get_stage!/1 returns the stage with given id" do
      stage = stage_fixture()
      assert Board.get_stage!(stage.id) == stage
    end

    test "create_stage/1 with valid data creates a stage" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Stage{} = stage} = Board.create_stage(valid_attrs)
      assert stage.title == "some title"
    end

    test "create_stage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Board.create_stage(@invalid_attrs)
    end

    test "update_stage/2 with valid data updates the stage" do
      stage = stage_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Stage{} = stage} = Board.update_stage(stage, update_attrs)
      assert stage.title == "some updated title"
    end

    test "update_stage/2 with invalid data returns error changeset" do
      stage = stage_fixture()
      assert {:error, %Ecto.Changeset{}} = Board.update_stage(stage, @invalid_attrs)
      assert stage == Board.get_stage!(stage.id)
    end

    test "delete_stage/1 deletes the stage" do
      stage = stage_fixture()
      assert {:ok, %Stage{}} = Board.delete_stage(stage)
      assert_raise Ecto.NoResultsError, fn -> Board.get_stage!(stage.id) end
    end

    test "change_stage/1 returns a stage changeset" do
      stage = stage_fixture()
      assert %Ecto.Changeset{} = Board.change_stage(stage)
    end
  end
end
