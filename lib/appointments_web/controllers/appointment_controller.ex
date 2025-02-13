defmodule AppointmentsWeb.AppointmentController do
  use AppointmentsWeb, :controller

  alias Appointments.Customers
  alias Appointments.Customers.Appointment

  action_fallback AppointmentsWeb.FallbackController

  def index(conn, _params) do
    appointments = Customers.list_appointments()
    render(conn, :index, appointments: appointments)
  end

  def create(conn, %{"appointment" => appointment_params}) do
    with {:ok, %Appointment{} = appointment} <- Customers.create_appointment(appointment_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/appointments/#{appointment}")
      |> render(:show, appointment: appointment)
    end
  end

  def show(conn, %{"id" => id}) do
    appointment = Customers.get_appointment!(id)
    render(conn, :show, appointment: appointment)
  end

  def update(conn, %{"id" => id, "appointment" => appointment_params}) do
    appointment = Customers.get_appointment!(id)

    with {:ok, %Appointment{} = appointment} <-
           Customers.update_appointment(appointment, appointment_params) do
      render(conn, :show, appointment: appointment)
    end
  end

  def delete(conn, %{"id" => id}) do
    appointment = Customers.get_appointment!(id)

    with {:ok, %Appointment{}} <- Customers.delete_appointment(appointment) do
      send_resp(conn, :no_content, "")
    end
  end
end
