FROM elixir:alpine

RUN apk add build-base git python3

WORKDIR /app

RUN mix local.hex --force && mix local.rebar --force

COPY mix.exs mix.lock ./
COPY config config

RUN mix do deps.get, deps.compile

COPY priv priv
COPY lib lib

CMD [ "mix", "phx.server" ]
