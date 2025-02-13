defmodule Appointments.Repo do
  use Ecto.Repo,
    otp_app: :appointments,
    adapter: Ecto.Adapters.Postgres
end
