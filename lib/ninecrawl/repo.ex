defmodule Ninecrawl.Repo do
  use Ecto.Repo,
    otp_app: :ninecrawl,
    adapter: Ecto.Adapters.MySQL
end
