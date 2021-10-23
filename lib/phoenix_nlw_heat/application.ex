defmodule PhoenixNlwHeat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PhoenixNlwHeat.Repo,
      # Start the Telemetry supervisor
      PhoenixNlwHeatWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixNlwHeat.PubSub},
      # Start the Endpoint (http/https)
      PhoenixNlwHeatWeb.Endpoint,
      # Start a worker by calling: PhoenixNlwHeat.Worker.start_link(arg)
      # {PhoenixNlwHeat.Worker, arg}
      PhoenixNlwHeat.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixNlwHeat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixNlwHeatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
