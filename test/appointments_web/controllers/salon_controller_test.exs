defmodule AppointmentsWeb.SalonControllerTest do
  use AppointmentsWeb.ConnCase

  import Appointments.CustomersFixtures

  alias Appointments.Customers.Salon

  @create_attrs %{
    name: "some name",
    location: %{}
  }
  @update_attrs %{
    name: "some updated name",
    location: %{}
  }
  @invalid_attrs %{name: nil, location: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all salons", %{conn: conn} do
      conn = get(conn, ~p"/api/salons")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create salon" do
    test "renders salon when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/salons", salon: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/salons/#{id}")

      assert %{
               "id" => ^id,
               "location" => %{},
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/salons", salon: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update salon" do
    setup [:create_salon]

    test "renders salon when data is valid", %{conn: conn, salon: %Salon{id: id} = salon} do
      conn = put(conn, ~p"/api/salons/#{salon}", salon: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/salons/#{id}")

      assert %{
               "id" => ^id,
               "location" => %{},
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, salon: salon} do
      conn = put(conn, ~p"/api/salons/#{salon}", salon: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete salon" do
    setup [:create_salon]

    test "deletes chosen salon", %{conn: conn, salon: salon} do
      conn = delete(conn, ~p"/api/salons/#{salon}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/salons/#{salon}")
      end
    end
  end

  defp create_salon(_) do
    salon = salon_fixture()
    %{salon: salon}
  end
end
