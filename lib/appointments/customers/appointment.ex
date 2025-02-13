defmodule Appointments.Customers.Appointment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "appointments" do
    field :customer_name, :string
    field :appointment_time, :utc_datetime
    belongs_to :salon, Appointments.Customers.Salon
    belongs_to :service, Appointments.Customers.Service

    # field :salon_id, :id
    # field :service_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(appointment, attrs) do
    appointment
    |> cast(attrs, [:customer_name, :appointment_time])
    |> validate_required([:customer_name, :appointment_time])
  end
end
