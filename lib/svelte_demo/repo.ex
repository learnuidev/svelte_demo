defmodule SvelteDemo.Repo do
  use Ecto.Repo,
    otp_app: :svelte_demo,
    adapter: Ecto.Adapters.Postgres
end
