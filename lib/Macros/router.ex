defmodule Platform.Macros.Router do
  defmacro __using__(_options) do

    quote do
      def init(options) do
        options
      end

      def call(conn, _options) do
        route(conn.method, conn.path_info, conn)
      end
    end

  end
end
