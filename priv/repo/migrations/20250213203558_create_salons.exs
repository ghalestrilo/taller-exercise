defmodule Appointments.Repo.Migrations.CreateSalons do
  use Ecto.Migration

  def change do
    create table(:salons) do
      add :name, :string
      add :location, :map

      timestamps(type: :utc_datetime)
    end
  end
end
