import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :weather, WeatherWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Fe18bMzx5lmsaUpqQ84OBdDbVxGXmeFYBxLoiK+oaGJiOsI7A0k+8+9nHtB48twO",
  server: false

# In test we don't send emails.
config :weather, Weather.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
