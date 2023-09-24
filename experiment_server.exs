defmodule ExperimentServer do
  require Logger

  def start(port) do
    # The reuseaddr option lets us create a new listening socket even if the previously open socket isn't properly closed
    listener_options = [active: false, packet: :http_bin, reuseaddr: true]

    {:ok, listen_socket} =
      :gen_tcp.listen(port, listener_options)

    Logger.info("Listening on port #{port}")

    listen(listen_socket)
    :gen_tcp.close(listen_socket)
  end

  defp listen(listen_socket) do
    {:ok, connection_sock} = :gen_tcp.accept(listen_socket)
    {:ok, req} = :gen_tcp.recv(connection_sock, 0)

    Logger.info("Got request: #{inspect(req)}")
    respond(connection_sock)
    listen(listen_socket)
  end

  defp respond(connection_sock) do
    :gen_tcp.send(connection_sock, "Hello World")

    Logger.info("Sent response")

    :gen_tcp.close(connection_sock)
  end
end

ExperimentServer.start(4040)
