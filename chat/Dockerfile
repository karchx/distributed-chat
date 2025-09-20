FROM elixir:alpine

COPY . .

RUN apk update && apk add inotify-tools

RUN mix local.hex --force && \
    mix local.rebar --force

RUN mix do deps.get, deps.compile

EXPOSE 4000
CMD ["mix", "run", "--no-halt"]

