defmodule Kanban.Board do
  @moduledoc """
  The Board context.
  """

  import Ecto.Query, warn: false
  alias Kanban.Repo

  alias Kanban.Board.Card

  @doc """
  Returns the list of cards.

  ## Examples

      iex> list_cards()
      [%Card{}, ...]

  """
  def list_cards do
    Repo.all(Card)
  end

  @doc """
  Gets a single card.

  Raises `Ecto.NoResultsError` if the Card does not exist.

  ## Examples

      iex> get_card!(123)
      %Card{}

      iex> get_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_card!(id), do: Repo.get!(Card, id)

  @doc """
  Creates a card.

  ## Examples

      iex> create_card(%{field: value})
      {:ok, %Card{}}

      iex> create_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_card(attrs \\ %{}) do
    %Card{}
    |> Card.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a card.

  ## Examples

      iex> update_card(card, %{field: new_value})
      {:ok, %Card{}}

      iex> update_card(card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_card(%Card{} = card, attrs) do
    card
    |> Card.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a card.

  ## Examples

      iex> delete_card(card)
      {:ok, %Card{}}

      iex> delete_card(card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_card(%Card{} = card) do
    Repo.delete(card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking card changes.

  ## Examples

      iex> change_card(card)
      %Ecto.Changeset{data: %Card{}}

  """
  def change_card(%Card{} = card, attrs \\ %{}) do
    Card.changeset(card, attrs)
  end

  alias Kanban.Board.Stage

  @doc """
  Returns the list of stages.

  ## Examples

      iex> list_stages()
      [%Stage{}, ...]

  """
  def list_stages do
    Repo.all(Stage)
  end

  @doc """
  Gets a single stage.

  Raises `Ecto.NoResultsError` if the Stage does not exist.

  ## Examples

      iex> get_stage!(123)
      %Stage{}

      iex> get_stage!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stage!(id), do: Repo.get!(Stage, id)

  @doc """
  Creates a stage.

  ## Examples

      iex> create_stage(%{field: value})
      {:ok, %Stage{}}

      iex> create_stage(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stage(attrs \\ %{}) do
    %Stage{}
    |> Stage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stage.

  ## Examples

      iex> update_stage(stage, %{field: new_value})
      {:ok, %Stage{}}

      iex> update_stage(stage, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stage(%Stage{} = stage, attrs) do
    stage
    |> Stage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stage.

  ## Examples

      iex> delete_stage(stage)
      {:ok, %Stage{}}

      iex> delete_stage(stage)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stage(%Stage{} = stage) do
    Repo.delete(stage)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stage changes.

  ## Examples

      iex> change_stage(stage)
      %Ecto.Changeset{data: %Stage{}}

  """
  def change_stage(%Stage{} = stage, attrs \\ %{}) do
    Stage.changeset(stage, attrs)
  end
end
