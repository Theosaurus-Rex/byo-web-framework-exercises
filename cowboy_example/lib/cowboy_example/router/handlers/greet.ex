defmodule CowboyExample.Router.Handlers.Greet do
  @moduledoc """
  This module defines the handler for the "/greet/:who" route
  """

  require Logger

  @default_greeting "Hello"

  @doc """
  This function handles the "/greet/:who", logs the requests and responds with Hello `who` as the body
  """
  def init(%{method: "GET"} = req0, state) do
    Logger.info("Received request: #{inspect(req0)}")

    who = :cowboy_req.binding(:who, req0)

    greeting =
      req0
      |> :cowboy_req.parse_qs()
      |> Enum.into(%{})
      |> Map.get("greeting", @default_greeting)

    req1 =
      :cowboy_req.reply(
        200,
        %{"content-type" => "text/html"},
        "#{greeting} #{who}",
        req0
      )

    {:ok, req1, state}
  end

  # General clause for init/2 that responds with a 404
  def init(req0, state) do
    Logger.info("Received request: #{inspect(req0)}")

    req1 =
      :cowboy_req.reply(
        404,
        %{"content-type" => "text/html"},
        "404 Not Found",
        req0
      )

    {:ok, req1, state}
  end
end
