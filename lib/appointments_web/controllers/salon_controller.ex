defmodule AppointmentsWeb.SalonController do
  use AppointmentsWeb, :controller

  alias Appointments.Customers
  alias Appointments.Customers.Salon

  action_fallback AppointmentsWeb.FallbackController

  def index(conn, _params) do
    salons = Customers.list_salons()
    render(conn, :index, salons: salons)
  end

  def create(conn, %{"salon" => salon_params}) do
    with {:ok, %Salon{} = salon} <- Customers.create_salon(salon_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/salons/#{salon}")
      |> render(:show, salon: salon)
    end
  end

  def show(conn, %{"id" => id}) do
    salon = Customers.get_salon!(id)
    render(conn, :show, salon: salon)
  end

  def update(conn, %{"id" => id, "salon" => salon_params}) do
    salon = Customers.get_salon!(id)

    with {:ok, %Salon{} = salon} <- Customers.update_salon(salon, salon_params) do
      render(conn, :show, salon: salon)
    end
  end

  def delete(conn, %{"id" => id}) do
    salon = Customers.get_salon!(id)

    with {:ok, %Salon{}} <- Customers.delete_salon(salon) do
      send_resp(conn, :no_content, "")
    end
  end
end
