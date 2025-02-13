defmodule AppointmentsWeb.ServiceJSON do
  alias Appointments.Customers.Service

  @doc """
  Renders a list of services.
  """
  def index(%{services: services}) do
    %{data: for(service <- services, do: data(service))}
  end

  @doc """
  Renders a single service.
  """
  def show(%{service: service}) do
    %{data: data(service)}
  end

  defp data(%Service{} = service) do
    %{
      id: service.id,
      name: service.name,
      price: service.price
    }
  end
end
