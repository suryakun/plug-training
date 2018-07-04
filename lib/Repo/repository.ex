defmodule Platform.Repo do
  use Ecto.Repo,
    otp_app: :platform,
    adapter: Sqlite.Ecto
end
