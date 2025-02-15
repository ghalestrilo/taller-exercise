defmodule AppointmentsWeb.ServiceControllerTest do
  use AppointmentsWeb.ConnCase

  import Appointments.CustomersFixtures

  alias Appointments.Customers.Service

  @create_attrs %{
    name: "some name",
    price: "120.5"
  }
  @update_attrs %{
    name: "some updated name",
    price: "456.7"
  }
  @invalid_attrs %{name: nil, price: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all services", %{conn: conn} do
      conn = get(conn, ~p"/api/services")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create service" do
    test "renders service when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/services", service: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/services/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name",
               "price" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/services", service: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update service" do
    setup [:create_service]

    test "renders service when data is valid", %{conn: conn, service: %Service{id: id} = service} do
      conn = put(conn, ~p"/api/services/#{service}", service: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/services/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name",
               "price" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, service: service} do
      conn = put(conn, ~p"/api/services/#{service}", service: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete service" do
    setup [:create_service]

    test "deletes chosen service", %{conn: conn, service: service} do
      conn = delete(conn, ~p"/api/services/#{service}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/services/#{service}")
      end
    end
  end

  defp create_service(_) do
    service = service_fixture()
    %{service: service}
  end
end
