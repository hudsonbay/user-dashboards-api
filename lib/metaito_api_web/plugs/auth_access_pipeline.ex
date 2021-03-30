defmodule MetaitoApiWeb.Plugs.AuthAccessPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :metaito_api,
    module: MetaitoApi.Guardian,
    error_handler: MetaitoApi.Accounts.ErrorHandlers

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, allow_blank: true
end
