FROM elixir:1.3.2
RUN mkdir -p /app
COPY . /app
WORKDIR /app
RUN mix local.hex --force
RUN mix deps.get
RUN mix compile
