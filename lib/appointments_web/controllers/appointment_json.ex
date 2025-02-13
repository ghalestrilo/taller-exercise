defmodule AppointmentsWeb.AppointmentJSON do
  alias Appointments.Customers.Appointment

  @doc """
  Renders a list of appointments.
  """
  def index(%{appointments: appointments}) do
    %{data: for(appointment <- appointments, do: data(appointment))}
  end

  @doc """
  Renders a single appointment.
  """
  def show(%{appointment: appointment}) do
    %{data: data(appointment)}
  end

  defp data(%Appointment{} = appointment) do
    %{
      id: appointment.id,
      salon_id: appointment.salon_id,
      service_id: appointment.service_id,
      customer_name: appointment.customer_name,
      appointment_time: appointment.appointment_time
    }
  end
end
