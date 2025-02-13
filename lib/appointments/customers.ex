defmodule Appointments.Customers do
  @moduledoc """
  The Customers context.
  """

  import Ecto.Query, warn: false
  alias Appointments.Repo

  alias Appointments.Customers.Salon

  @doc """
  Returns the list of salons.

  ## Examples

      iex> list_salons()
      [%Salon{}, ...]

  """
  def list_salons do
    Repo.all(Salon)
  end

  @doc """
  Gets a single salon.

  Raises `Ecto.NoResultsError` if the Salon does not exist.

  ## Examples

      iex> get_salon!(123)
      %Salon{}

      iex> get_salon!(456)
      ** (Ecto.NoResultsError)

  """
  def get_salon!(id), do: Repo.get!(Salon, id)

  @doc """
  Creates a salon.

  ## Examples

      iex> create_salon(%{field: value})
      {:ok, %Salon{}}

      iex> create_salon(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_salon(attrs \\ %{}) do
    %Salon{}
    |> Salon.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a salon.

  ## Examples

      iex> update_salon(salon, %{field: new_value})
      {:ok, %Salon{}}

      iex> update_salon(salon, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_salon(%Salon{} = salon, attrs) do
    salon
    |> Salon.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a salon.

  ## Examples

      iex> delete_salon(salon)
      {:ok, %Salon{}}

      iex> delete_salon(salon)
      {:error, %Ecto.Changeset{}}

  """
  def delete_salon(%Salon{} = salon) do
    Repo.delete(salon)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking salon changes.

  ## Examples

      iex> change_salon(salon)
      %Ecto.Changeset{data: %Salon{}}

  """
  def change_salon(%Salon{} = salon, attrs \\ %{}) do
    Salon.changeset(salon, attrs)
  end
end
