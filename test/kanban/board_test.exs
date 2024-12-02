defmodule Kanban.BoardTest do
  use Kanban.DataCase

  alias Kanban.Board

  describe "cards" do
    alias Kanban.Board.Card

    import Kanban.BoardFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Board.create_card(@invalid_attrs)
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
