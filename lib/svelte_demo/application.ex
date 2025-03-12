defmodule SvelteDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SvelteDemoWeb.Telemetry,
      SvelteDemo.Repo,
      {DNSCluster, query: Application.get_env(:svelte_demo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SvelteDemo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SvelteDemo.Finch},
      # Start a worker by calling: SvelteDemo.Worker.start_link(arg)
      # {SvelteDemo.Worker, arg},
      # Start to serve requests, typically the last entry
      SvelteDemoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SvelteDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SvelteDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
