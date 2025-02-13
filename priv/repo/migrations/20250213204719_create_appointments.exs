defmodule Appointments.Repo.Migrations.CreateAppointments do
  use Ecto.Migration

  def change do
    create table(:appointments) do
      add :customer_name, :string
      add :appointment_time, :utc_datetime
      add :salon_id, references(:salons, on_delete: :nothing)
      add :service_id, references(:services, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:appointments, [:salon_id])
    create index(:appointments, [:service_id])
  end
end
