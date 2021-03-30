defmodule MetaitoApi.Repo do
  use Ecto.Repo,
    otp_app: :metaito_api,
    adapter: Ecto.Adapters.Postgres
end
