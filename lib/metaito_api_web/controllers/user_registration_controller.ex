defmodule MetaitoApiWeb.UserRegistrationController do
  use MetaitoApiWeb, :controller

  alias MetaitoApi.Accounts
  alias MetaitoApi.Accounts.User
  # alias MetaitoApiWeb.UserAuth

  alias MetaitoApiWeb.ChangesetView

  action_fallback MetaitoApiWeb.FallbackController

  def new(conn, _params) do
    changeset = Accounts.change_user_registration(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        conn
        |> put_status(201)
        |> render("create.json", user: user)

      {:error, changeset} ->
        conn
        |> render(ChangesetView, "error.json", changeset: changeset)
    end
  end
end
