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
end
