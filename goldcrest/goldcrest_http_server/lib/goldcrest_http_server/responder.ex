defmodule Goldcrest.HTTPServer.Responder do
  @type method :: :GET | :POST | :PUT | :PATCH | :DELETE

  @callback resp(term(), method(), string()) :: Goldcrest.HTTPResponse.t()
end
