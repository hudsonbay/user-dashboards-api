defmodule MetaitoApiWeb.DashboardControllerTest do
  use MetaitoApiWeb.ConnCase

  alias MetaitoApi.Profile
  alias MetaitoApi.Profile.Dashboard

  @create_attrs %{
    title: "some title"
  }
  @update_attrs %{
    title: "some updated title"
  }
  @invalid_attrs %{title: nil}

  def fixture(:dashboard) do
    {:ok, dashboard} = Profile.create_dashboard(@create_attrs)
    dashboard
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all dashboards", %{conn: conn} do
      conn = get(conn, Routes.dashboard_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create dashboard" do
    test "renders dashboard when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dashboard_path(conn, :create), dashboard: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.dashboard_path(conn, :show, id))

      assert %{
               "id" => id,
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dashboard_path(conn, :create), dashboard: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update dashboard" do
    setup [:create_dashboard]

    test "renders dashboard when data is valid", %{
      conn: conn,
      dashboard: %Dashboard{id: id} = dashboard
    } do
      conn = put(conn, Routes.dashboard_path(conn, :update, dashboard), dashboard: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.dashboard_path(conn, :show, id))

      assert %{
               "id" => id,
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, dashboard: dashboard} do
      conn = put(conn, Routes.dashboard_path(conn, :update, dashboard), dashboard: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete dashboard" do
    setup [:create_dashboard]

    test "deletes chosen dashboard", %{conn: conn, dashboard: dashboard} do
      conn = delete(conn, Routes.dashboard_path(conn, :delete, dashboard))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.dashboard_path(conn, :show, dashboard))
      end
    end
  end

  defp create_dashboard(_) do
    dashboard = fixture(:dashboard)
    %{dashboard: dashboard}
  end
end
