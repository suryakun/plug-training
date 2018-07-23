defmodule Platform.Macros.Router do
  defmacro __using__(_options) do

    quote do
      use Plug.Router
      plug Plug.Logger
      plug Plug.Parsers, parsers: [:urlencoded, :multipart]
      plug :match
      plug :dispatch
    end

  end
end
