defmodule MetaitoApiWeb.UserController do
  use MetaitoApiWeb, :controller

  alias MetaitoApi.Accounts

  action_fallback MetaitoApiWeb.FallbackController

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  # def update(conn, %{"id" => id, "product" => product_params}) do
  #   product = Client.get_product!(id)

  #   with {:ok, %Product{} = product} <- Client.update_product(product, product_params) do
  #     render(conn, "show.json", product: product)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   product = Client.get_product!(id)

  #   with {:ok, %Product{}} <- Client.delete_product(product) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
