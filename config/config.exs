# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :ninecrawl, Ninecrawl.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DB_USER") || "root",
  password: System.get_env("DB_PASS") || "Mercy-123",
  port: System.get_env("DB_PORT") || 3306,
  database: "wind",
  hostname: System.get_env("DB_HOST") || "nuc-mysql",
  pool_size: 10

# config :ninecrawl, Ninecrawl.Repo,
#   adapter: Ecto.Adapters.Postgres,
#   username: "root",
#   password: "Mercy-123",
#   port: 3306,
#   database: "wind",
#   hostname: "127.0.0.1",
#   pool_size: 10

config :ninecrawl, ecto_repos: [Ninecrawl.Repo]

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :ninecrawl, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:ninecrawl, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env()}.exs"
