defmodule Platform.Router.User do
  import Plug.Conn
  use Platform.Macros.Router
  require EEx
  alias Platform.Service.User, as: UserService

  EEx.function_from_file :def, :show_user, "lib/Templates/show_user.eex", [:user]

  get "/" do
    send_resp(conn, 200, "This is User page")
  end

  get "/:user_id" do
    case UserService.getById(user_id) do
      nil ->
        conn |> send_resp(404, "User not found")
      user ->
        page_content = show_user(user)
    end

    conn
      |> put_resp_content_type("text/html")
      |> send_resp(200, page_content)
  end

end
