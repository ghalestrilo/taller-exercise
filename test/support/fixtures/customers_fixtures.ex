defmodule Appointments.CustomersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Appointments.Customers` context.
  """

  @doc """
  Generate a salon.
  """
  def salon_fixture(attrs \\ %{}) do
    {:ok, salon} =
      attrs
      |> Enum.into(%{
        location: %{},
        name: "some name"
      })
      |> Appointments.Customers.create_salon()

    salon
  end

  @doc """
  Generate a service.
  """
  def service_fixture(attrs \\ %{}) do
    {:ok, service} =
      attrs
      |> Enum.into(%{
        name: "some name",
        price: "120.5"
      })
      |> Appointments.Customers.create_service()

    service
  end
end
