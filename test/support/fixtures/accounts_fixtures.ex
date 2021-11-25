defmodule UuidApp.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UuidApp.Accounts` context.
  """

  @doc """
  Generate a unique user username.
  """
  def unique_user_username, do: "some username#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name",
        username: unique_user_username()
      })
      |> UuidApp.Accounts.create_user()

    user
  end
end
