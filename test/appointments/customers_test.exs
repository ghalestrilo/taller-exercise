defmodule Appointments.CustomersTest do
  use Appointments.DataCase

  alias Appointments.Customers

  describe "salons" do
    alias Appointments.Customers.Salon

    import Appointments.CustomersFixtures

    @invalid_attrs %{name: nil, location: nil}

    test "list_salons/0 returns all salons" do
      salon = salon_fixture()
      assert Customers.list_salons() == [salon]
    end

    test "get_salon!/1 returns the salon with given id" do
      salon = salon_fixture()
      assert Customers.get_salon!(salon.id) == salon
    end

    test "create_salon/1 with valid data creates a salon" do
      valid_attrs = %{name: "some name", location: %{}}

      assert {:ok, %Salon{} = salon} = Customers.create_salon(valid_attrs)
      assert salon.name == "some name"
      assert salon.location == %{}
    end

    test "create_salon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Customers.create_salon(@invalid_attrs)
    end

    test "update_salon/2 with valid data updates the salon" do
      salon = salon_fixture()
      update_attrs = %{name: "some updated name", location: %{}}

      assert {:ok, %Salon{} = salon} = Customers.update_salon(salon, update_attrs)
      assert salon.name == "some updated name"
      assert salon.location == %{}
    end

    test "update_salon/2 with invalid data returns error changeset" do
      salon = salon_fixture()
      assert {:error, %Ecto.Changeset{}} = Customers.update_salon(salon, @invalid_attrs)
      assert salon == Customers.get_salon!(salon.id)
    end

    test "delete_salon/1 deletes the salon" do
      salon = salon_fixture()
      assert {:ok, %Salon{}} = Customers.delete_salon(salon)
      assert_raise Ecto.NoResultsError, fn -> Customers.get_salon!(salon.id) end
    end

    test "change_salon/1 returns a salon changeset" do
      salon = salon_fixture()
      assert %Ecto.Changeset{} = Customers.change_salon(salon)
    end
  end
end
