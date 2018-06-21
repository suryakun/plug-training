defmodule Platform.Router.User do
  import Plug.Conn
  use Platform.Macros.Router

  def route("GET", ["users"], conn) do
    conn
    |> send_resp(200, "This is User page")
  end

  def route("GET", ["users", user_id], conn) do
    conn
    |> send_resp(200, "You are accessing user with id #{user_id}")
  end

end
