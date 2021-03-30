defmodule MetaitoApiWeb.UserRegistrationView do
  use MetaitoApiWeb, :view

  def render("create.json", %{user: user}) do
    %{
      status: :ok,
      data: %{
        email: user.email,
        inserted_at: user.inserted_at
      },
      message: "A new Metaito user has been created"
    }
  end

  def render("error.json", %{message: message}) do
    %{
      status: :not_found,
      data: %{},
      message: message
    }
  end
end
