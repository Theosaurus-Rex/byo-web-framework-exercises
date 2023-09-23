defmodule CowboyExample.Router do
  @moduledoc """
  This module defines all the routes, params, and handlers.

  This module is also the handler module for the root route.
  """
  require Logger

  @doc """
  Returns the list of routes configured by this web server
  """
  def routes do
    [
      # For now, this module itself will handle root requests
      {:_, [{"/", __MODULE__, []}]}
    ]
  end

  @doc """
  This function handles the root route, logs the requests and responds with Hello World as the body.
  """
  def init(req0, state) do
    Logger.info("Received request: #{inspect(req0)}")

    req1 =
      :cowboy_req.reply(
        200,
        %{"content-type" => "text/html"},
        "Hello World",
        req0
      )

    {:ok, req1, state}
  end
end
