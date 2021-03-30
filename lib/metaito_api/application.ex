defmodule MetaitoApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MetaitoApi.Repo,
      # Start the Telemetry supervisor
      MetaitoApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MetaitoApi.PubSub},
      # Start the Endpoint (http/https)
      MetaitoApiWeb.Endpoint
      # Start a worker by calling: MetaitoApi.Worker.start_link(arg)
      # {MetaitoApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MetaitoApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MetaitoApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
