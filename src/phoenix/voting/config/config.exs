# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :voting,
  ecto_repos: [Voting.Repo]

# Configures the endpoint
config :voting, VotingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r9cnXE7shgeKgcfSZi/Yve1VFeCkcn73N1Gk14r3nPFp6WqOT7kA2W1/9ocAw7rd",
  render_errors: [view: VotingWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Voting.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "FDYPTG0Q"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
