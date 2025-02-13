defmodule AppointmentsWeb.ServiceController do
  use AppointmentsWeb, :controller

  alias Appointments.Customers
  alias Appointments.Customers.Service

  action_fallback AppointmentsWeb.FallbackController

  def index(conn, _params) do
    services = Customers.list_services()
    render(conn, :index, services: services)
  end

  def create(conn, %{"service" => service_params}) do
    with {:ok, %Service{} = service} <- Customers.create_service(service_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/services/#{service}")
      |> render(:show, service: service)
    end
  end

  def show(conn, %{"id" => id}) do
    service = Customers.get_service!(id)
    render(conn, :show, service: service)
  end

  def update(conn, %{"id" => id, "service" => service_params}) do
    service = Customers.get_service!(id)

    with {:ok, %Service{} = service} <- Customers.update_service(service, service_params) do
      render(conn, :show, service: service)
    end
  end

  def delete(conn, %{"id" => id}) do
    service = Customers.get_service!(id)

    with {:ok, %Service{}} <- Customers.delete_service(service) do
      send_resp(conn, :no_content, "")
    end
  end
end
