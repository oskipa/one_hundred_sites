defmodule Confessions.DramaTest do
  use Confessions.DataCase

  alias Confessions.Drama

  describe "confessions" do
    alias Confessions.Drama.Confession

    @valid_attrs %{content: "some content"}
    @update_attrs %{content: "some updated content"}
    @invalid_attrs %{content: nil}

    def confession_fixture(attrs \\ %{}) do
      {:ok, confession} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Drama.create_confession()

      confession
    end

    test "list_confessions/0 returns all confessions" do
      confession = confession_fixture()
      assert Drama.list_confessions() == [confession]
    end

    test "get_confession!/1 returns the confession with given id" do
      confession = confession_fixture()
      assert Drama.get_confession!(confession.id) == confession
    end

    test "create_confession/1 with valid data creates a confession" do
      assert {:ok, %Confession{} = confession} = Drama.create_confession(@valid_attrs)
      assert confession.content == "some content"
    end

    test "create_confession/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Drama.create_confession(@invalid_attrs)
    end

    test "update_confession/2 with valid data updates the confession" do
      confession = confession_fixture()
      assert {:ok, %Confession{} = confession} = Drama.update_confession(confession, @update_attrs)
      assert confession.content == "some updated content"
    end

    test "update_confession/2 with invalid data returns error changeset" do
      confession = confession_fixture()
      assert {:error, %Ecto.Changeset{}} = Drama.update_confession(confession, @invalid_attrs)
      assert confession == Drama.get_confession!(confession.id)
    end

    test "delete_confession/1 deletes the confession" do
      confession = confession_fixture()
      assert {:ok, %Confession{}} = Drama.delete_confession(confession)
      assert_raise Ecto.NoResultsError, fn -> Drama.get_confession!(confession.id) end
    end

    test "change_confession/1 returns a confession changeset" do
      confession = confession_fixture()
      assert %Ecto.Changeset{} = Drama.change_confession(confession)
    end
  end
end
