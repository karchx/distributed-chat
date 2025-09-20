defmodule ChatWebsocket do
  @behaviour :cowboy_websocket

  def init(request, opts) do
    {:cowboy_websocket, request, opts}
  end

  def websocket_init(state) do
    {:ok, state}
  end

  def websocket_handle({:text, msg}, state) do
    IO.inspect("Received message: #{msg}")
    {:reply, {:text, "Echo: #{msg}"}, state}
  end

  def websocket_info(_info, state) do
    {:ok, state}
  end

  def terminate(_reason, _req, _state) do
    :ok
  end
end
