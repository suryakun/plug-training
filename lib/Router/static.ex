defmodule Platform.Router.Static do
  use Plug.Builder

  plug Plug.Static, at: "/", from: "files"

  plug :not_found

  def not_found(conn, _) do
    send_resp(conn, 404, "Resource not found")
  end
end


