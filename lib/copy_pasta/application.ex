defmodule CopyPasta.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CopyPastaWeb.Telemetry,
      # Start the Ecto repository
      CopyPasta.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: CopyPasta.PubSub},
      # Start Finch
      {Finch, name: CopyPasta.Finch},
      # Start the Endpoint (http/https)
      CopyPastaWeb.Endpoint
      # Start a worker by calling: CopyPasta.Worker.start_link(arg)
      # {CopyPasta.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CopyPasta.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CopyPastaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
