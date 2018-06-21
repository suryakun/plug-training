defmodule Platform do
  use Platform.Macros.Router
  import Plug.Conn
  alias Platform.Router.User

  @user_router_option User.init([])
  def route("GET", [], conn) do
    conn
    |> send_resp(200, "This is Index page")
  end

  def route(_method, ["users" | _path], conn) do
    User.call(conn, @user_router_option)
  end

  def route(_method, _path_info, conn) do
    conn
    |> send_resp(404, "Page not found")
  end

  def server() do
    {:ok, pid} = Plug.Adapters.Cowboy.http __MODULE__, []
    pid
  end

end
