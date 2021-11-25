defmodule UuidApp.Repo do
  use Ecto.Repo,
    otp_app: :uuid_app,
    adapter: Ecto.Adapters.Postgres
end
