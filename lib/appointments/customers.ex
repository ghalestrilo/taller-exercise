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

  alias Appointments.Customers.Service

  @doc """
  Returns the list of services.

  ## Examples

      iex> list_services()
      [%Service{}, ...]

  """
  def list_services do
    Repo.all(Service)
  end

  @doc """
  Gets a single service.

  Raises `Ecto.NoResultsError` if the Service does not exist.

  ## Examples

      iex> get_service!(123)
      %Service{}

      iex> get_service!(456)
      ** (Ecto.NoResultsError)

  """
  def get_service!(id), do: Repo.get!(Service, id)

  @doc """
  Creates a service.

  ## Examples

      iex> create_service(%{field: value})
      {:ok, %Service{}}

      iex> create_service(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_service(attrs \\ %{}) do
    %Service{}
    |> Service.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a service.

  ## Examples

      iex> update_service(service, %{field: new_value})
      {:ok, %Service{}}

      iex> update_service(service, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_service(%Service{} = service, attrs) do
    service
    |> Service.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a service.

  ## Examples

      iex> delete_service(service)
      {:ok, %Service{}}

      iex> delete_service(service)
      {:error, %Ecto.Changeset{}}

  """
  def delete_service(%Service{} = service) do
    Repo.delete(service)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking service changes.

  ## Examples

      iex> change_service(service)
      %Ecto.Changeset{data: %Service{}}

  """
  def change_service(%Service{} = service, attrs \\ %{}) do
    Service.changeset(service, attrs)
  end
end
