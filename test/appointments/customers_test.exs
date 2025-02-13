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

  describe "services" do
    alias Appointments.Customers.Service

    import Appointments.CustomersFixtures

    @invalid_attrs %{name: nil, price: nil}

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert Customers.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert Customers.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      valid_attrs = %{name: "some name", price: "120.5"}

      assert {:ok, %Service{} = service} = Customers.create_service(valid_attrs)
      assert service.name == "some name"
      assert service.price == Decimal.new("120.5")
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Customers.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      update_attrs = %{name: "some updated name", price: "456.7"}

      assert {:ok, %Service{} = service} = Customers.update_service(service, update_attrs)
      assert service.name == "some updated name"
      assert service.price == Decimal.new("456.7")
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = Customers.update_service(service, @invalid_attrs)
      assert service == Customers.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = Customers.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> Customers.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = Customers.change_service(service)
    end
  end
end
