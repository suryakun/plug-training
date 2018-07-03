defmodule Platform.Router.User do
  import Plug.Conn
  use Platform.Macros.Router
  require EEx

  EEx.function_from_file :def, :show_user, "lib/Templates/show_user.eex", [:user_id]

  get "/" do
    send_resp(conn, 200, "This is User page")
  end

  get "/:user_id" do
    page_content = show_user(user_id)
    conn
      |> put_resp_content_type("text/html")
      |> send_resp(200, page_content)
  end

end
