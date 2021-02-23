defmodule PhoenixDiscuss.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_discuss,
    adapter: Ecto.Adapters.Postgres
end
