defmodule AppointmentsWeb.AppointmentControllerTest do
  use AppointmentsWeb.ConnCase

  import Appointments.CustomersFixtures

  alias Appointments.Customers.Appointment

  @create_attrs %{
    customer_name: "some customer_name",
    appointment_time: ~U[2025-02-12 20:47:00Z]
  }
  @update_attrs %{
    customer_name: "some updated customer_name",
    appointment_time: ~U[2025-02-13 20:47:00Z]
  }
  @invalid_attrs %{customer_name: nil, appointment_time: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all appointments", %{conn: conn} do
      conn = get(conn, ~p"/api/appointments")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create appointment" do
    test "renders appointment when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/appointments", appointment: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/appointments/#{id}")

      assert %{
               "id" => ^id,
               "appointment_time" => "2025-02-12T20:47:00Z",
               "customer_name" => "some customer_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/appointments", appointment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update appointment" do
    setup [:create_appointment]

    test "renders appointment when data is valid", %{conn: conn, appointment: %Appointment{id: id} = appointment} do
      conn = put(conn, ~p"/api/appointments/#{appointment}", appointment: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/appointments/#{id}")

      assert %{
               "id" => ^id,
               "appointment_time" => "2025-02-13T20:47:00Z",
               "customer_name" => "some updated customer_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, appointment: appointment} do
      conn = put(conn, ~p"/api/appointments/#{appointment}", appointment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete appointment" do
    setup [:create_appointment]

    test "deletes chosen appointment", %{conn: conn, appointment: appointment} do
      conn = delete(conn, ~p"/api/appointments/#{appointment}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/appointments/#{appointment}")
      end
    end
  end

  defp create_appointment(_) do
    appointment = appointment_fixture()
    %{appointment: appointment}
  end
end
