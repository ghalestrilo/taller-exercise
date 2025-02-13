defmodule Appointments.Customers.Salon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "salons" do
    field :name, :string
    field :location, :map

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(salon, attrs) do
    salon
    |> cast(attrs, [:name, :location])
    |> validate_required([:name])
  end
end
