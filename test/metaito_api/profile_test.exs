defmodule MetaitoApi.ProfileTest do
  use MetaitoApi.DataCase

  alias MetaitoApi.Profile

  describe "dashboards" do
    alias MetaitoApi.Profile.Dashboard

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def dashboard_fixture(attrs \\ %{}) do
      {:ok, dashboard} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_dashboard()

      dashboard
    end

    test "list_dashboards/0 returns all dashboards" do
      dashboard = dashboard_fixture()
      assert Profile.list_dashboards() == [dashboard]
    end

    test "get_dashboard!/1 returns the dashboard with given id" do
      dashboard = dashboard_fixture()
      assert Profile.get_dashboard!(dashboard.id) == dashboard
    end

    test "create_dashboard/1 with valid data creates a dashboard" do
      assert {:ok, %Dashboard{} = dashboard} = Profile.create_dashboard(@valid_attrs)
      assert dashboard.title == "some title"
    end

    test "create_dashboard/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_dashboard(@invalid_attrs)
    end

    test "update_dashboard/2 with valid data updates the dashboard" do
      dashboard = dashboard_fixture()
      assert {:ok, %Dashboard{} = dashboard} = Profile.update_dashboard(dashboard, @update_attrs)
      assert dashboard.title == "some updated title"
    end

    test "update_dashboard/2 with invalid data returns error changeset" do
      dashboard = dashboard_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_dashboard(dashboard, @invalid_attrs)
      assert dashboard == Profile.get_dashboard!(dashboard.id)
    end

    test "delete_dashboard/1 deletes the dashboard" do
      dashboard = dashboard_fixture()
      assert {:ok, %Dashboard{}} = Profile.delete_dashboard(dashboard)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_dashboard!(dashboard.id) end
    end

    test "change_dashboard/1 returns a dashboard changeset" do
      dashboard = dashboard_fixture()
      assert %Ecto.Changeset{} = Profile.change_dashboard(dashboard)
    end
  end
end
