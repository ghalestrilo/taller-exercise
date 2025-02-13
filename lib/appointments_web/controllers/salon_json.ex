defmodule AppointmentsWeb.SalonJSON do
  alias Appointments.Customers.Salon

  @doc """
  Renders a list of salons.
  """
  def index(%{salons: salons}) do
    %{data: for(salon <- salons, do: data(salon))}
  end

  @doc """
  Renders a single salon.
  """
  def show(%{salon: salon}) do
    %{data: data(salon)}
  end

  defp data(%Salon{} = salon) do
    %{
      id: salon.id,
      name: salon.name,
      location: salon.location
    }
  end
end
