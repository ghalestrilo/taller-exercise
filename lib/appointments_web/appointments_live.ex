defmodule AppointmentsWeb.AppointmentsLive do
  alias Appointments.Customers.Appointment
  alias Appointments.Customers
  use AppointmentsWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1 class="mb-4">Appointments</h1>

    <div class="m-4">
      <h1>Create new Appointment</h1>
      
      <.form for={@form} phx-change="validate" phx-submit="save">
        <.input label="Customer Name" type="text" field={@form[:customer_name]} />
        <.input label="Appointment Time" type="text" field={@form[:appointment_time]} />
        <button>Save</button>
      </.form>
    </div>

    <div class="m-4">
      <%= for appointment <- @appointments do %>
        <div class="mb-8">
          <h1>name: {appointment.customer_name}</h1>
          
          <h2>time: {appointment.appointment_time}</h2>
          
          <h3>salon: {appointment.salon_id}</h3>
          
          <h3>service: {appointment.service_id}</h3>
        </div>
      <% end %>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    appointments = Customers.list_appointments()

    form =
      %Appointment{}
      |> Customers.change_appointment()
      |> to_form(action: :validate)

    socket =
      socket
      |> assign(appointments: appointments)
      |> assign(form: form)

    {:ok, socket}
  end

  def handle_event("validate", %{"appointment" => params}, socket) do
    form =
      %Appointment{}
      |> Customers.change_appointment(params)
      |> to_form(action: :validate)

    {:noreply, assign(socket, form: form)}
  end

  def handle_event("save", %{"appointment" => appointment_params}, socket) do
    case Customers.create_appointment(appointment_params) do
      {:ok, appointment} ->
        socket
        |> put_flash(:info, "appointment created")
        # |> redirect(to: ~p"/appointments/#{appointment}")
        |> then(&{:noreply, &1})

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
