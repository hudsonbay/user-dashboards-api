# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :metaito_api,
  ecto_repos: [MetaitoApi.Repo]

# Configures the endpoint
config :metaito_api, MetaitoApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "G+5irH+uC1KJjne+xMSkMp5RZ46Bwf9iiiG26CGGUFB7Pp+pY3ZE3FHGbYZIEmv2",
  render_errors: [view: MetaitoApiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MetaitoApi.PubSub,
  live_view: [signing_salt: "mMWDlw0D"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :metaito_api, MetaitoApi.Guardian,
       issuer: "metaito_api",
       secret_key: "ItbkOIr5Mg/2cgX7csPuTRKno4zAnzN9IbMgJ05EHFd3qNZ7d21FW2vrfMmYgXNG"
