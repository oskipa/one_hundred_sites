defmodule ConfessionsWeb.ConfessionControllerTest do
  use ConfessionsWeb.ConnCase

  alias Confessions.Drama

  @create_attrs %{content: "some content"}
  @update_attrs %{content: "some updated content"}
  @invalid_attrs %{content: nil}

  def fixture(:confession) do
    {:ok, confession} = Drama.create_confession(@create_attrs)
    confession
  end

  describe "index" do
    test "lists all confessions", %{conn: conn} do
      conn = get(conn, Routes.confession_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Confessions"
    end
  end

  describe "new confession" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.confession_path(conn, :new))
      assert html_response(conn, 200) =~ "New Confession"
    end
  end

  describe "create confession" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.confession_path(conn, :create), confession: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.confession_path(conn, :show, id)

      conn = get(conn, Routes.confession_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Confession"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.confession_path(conn, :create), confession: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Confession"
    end
  end

  describe "edit confession" do
    setup [:create_confession]

    test "renders form for editing chosen confession", %{conn: conn, confession: confession} do
      conn = get(conn, Routes.confession_path(conn, :edit, confession))
      assert html_response(conn, 200) =~ "Edit Confession"
    end
  end

  describe "update confession" do
    setup [:create_confession]

    test "redirects when data is valid", %{conn: conn, confession: confession} do
      conn = put(conn, Routes.confession_path(conn, :update, confession), confession: @update_attrs)
      assert redirected_to(conn) == Routes.confession_path(conn, :show, confession)

      conn = get(conn, Routes.confession_path(conn, :show, confession))
      assert html_response(conn, 200) =~ "some updated content"
    end

    test "renders errors when data is invalid", %{conn: conn, confession: confession} do
      conn = put(conn, Routes.confession_path(conn, :update, confession), confession: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Confession"
    end
  end

  describe "delete confession" do
    setup [:create_confession]

    test "deletes chosen confession", %{conn: conn, confession: confession} do
      conn = delete(conn, Routes.confession_path(conn, :delete, confession))
      assert redirected_to(conn) == Routes.confession_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.confession_path(conn, :show, confession))
      end
    end
  end

  defp create_confession(_) do
    confession = fixture(:confession)
    {:ok, confession: confession}
  end
end
