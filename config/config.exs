# This file is responsible for configuring your application
# and its dependencies. The Mix.Config module provides functions
# to aid in doing so.
use Mix.Config

# Qpidpn configuration:

config :qpidpn,
        path: "/qpidpn/priv",
        host: 'amqp://127.0.0.1/'
