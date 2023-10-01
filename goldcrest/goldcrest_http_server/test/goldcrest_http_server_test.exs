defmodule GoldcrestHTTPServerTest do
  use ExUnit.Case
  doctest GoldcrestHTTPServer

  test "greets the world" do
    assert GoldcrestHTTPServer.hello() == :world
  end
end
