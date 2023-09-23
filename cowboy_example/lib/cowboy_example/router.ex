defmodule CowboyExample.Router do
  @moduledoc """
  This module defines all the routes, params, and handlers.
  """
  require Logger
  alias CowboyExample.Router.Handlers.{Root, Greet, Static}

  @doc """
  Returns the list of routes configured by this web server
  """
  def routes do
    [
      # For now, this module itself will handle root requests
      {:_,
       [
         {"/", Root, []},
         {"/greet/:who", [who: :nonempty], Greet, []},
         {"/static/:page", [page: :nonempty], Static, []}
       ]}
    ]
  end
end
