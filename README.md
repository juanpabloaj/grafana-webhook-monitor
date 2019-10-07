# Grafana webhook monitor

Show Grafana's webhook notifications

https://grafana.com/docs/alerting/notifications/#webhook

Send a message to test

    curl -X POST -H "Content-Type:application/json" -d @grafana_webhook_payload.json http://0.0.0.0:4000/api

### Run

With docker

    docker run --rm --name  grafana-monitor -p 0.0.0.0:4000:4000 -d juanpabloaj/grafana-webhook-monitor

Or to start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more about Phoenix

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
