defmodule Chat.Application do
  require Logger
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Chat,
        options: [
          dispatch: dispatch(),
          port: 4000
        ]
      )
    ]

    Logger.info("Starting application...")

    opts = [strategy: :one_for_one, name: Chat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp dispatch do
    [
      {:_, [
        {"/ws", ChatWebsocket, []},
        {"/", Plug.Cowboy.Handler, {Chat, []}}
      ]}
    ]
  end
end
