defmodule CopyPasta.Repo do
  use Ecto.Repo,
    otp_app: :copy_pasta,
    adapter: Ecto.Adapters.Postgres
end
