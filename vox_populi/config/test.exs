use Mix.Config

# Configure your database
config :vox_populi, VoxPopuli.Repo,
  username: "postgres",
  password: "postgres",
  database: "vox_populi_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :vox_populi, VoxPopuliWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
