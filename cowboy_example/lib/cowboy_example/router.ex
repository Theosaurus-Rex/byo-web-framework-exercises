defmodule CowboyExample.Router do
  @moduledoc """
  This module defines all the routes, params, and handlers.
  """
  require Logger
  alias CowboyExample.Router.Handlers.{Root, Greet}

  @doc """
  Returns the list of routes configured by this web server
  """
  def routes do
    [
      # For now, this module itself will handle root requests
      {:_,
       [
         {"/", Root, []},
         {"/greet/:who", [who: :nonempty], Greet, []}
       ]}
    ]
  end
end
