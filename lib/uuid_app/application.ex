defmodule UuidApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      UuidApp.Repo,
      # Start the Telemetry supervisor
      UuidAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: UuidApp.PubSub},
      # Start the Endpoint (http/https)
      UuidAppWeb.Endpoint
      # Start a worker by calling: UuidApp.Worker.start_link(arg)
      # {UuidApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UuidApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    UuidAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
