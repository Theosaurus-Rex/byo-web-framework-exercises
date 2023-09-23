defmodule CowboyExample.Router.Handlers.Static do
  @moduledoc """
  This module defines the handler for the "/static/:page" route.
  """

  require Logger

  @doc """
  This handles the "/static/:page" route, logs the requests and responds with the requested static HTML page.

  Responds with 404 if the page isn't found in the priv/static folder
  """

  def init(req0, state) do
    Logger.info("Received request: #{inspect(req0)}")

    page = :cowboy_req.binding(:page, req0)

    req1 =
      case html_for(page) do
        {:ok, static_html} ->
          :cowboy_req.reply(200, %{"content-type" => "text/html"}, static_html, req0)

        _ ->
          :cowboy_req.reply(404, %{"content-type" => "text/html"}, "404 Not Found", req0)
      end

    {:ok, req1, state}
  end

  defp html_for(page) do
    priv_dir = :cowboy_example |> :code.priv_dir() |> to_string()

    page_path = priv_dir <> "/static/#{page}"

    File.read(page_path)
  end
end
