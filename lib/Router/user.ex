defmodule Platform.Router.User do
  import Plug.Conn
  use Platform.Macros.Router
  require EEx
  require IEx

  EEx.function_from_file :def, :show_user, "lib/Templates/show_user.eex", [:user]
  EEx.function_from_file :def, :register_user, "lib/Templates/register.eex", []

  get "/" do
    send_resp(conn, 200, "This is User page")
  end

  get "/register" do
    page = register_user()
    conn |> put_resp_content_type("text/html") |> send_resp(200, page)
  end

  post "/register" do
	%{"address" => address, "name" => name, "email" => email, "password" => password} = conn.body_params
	user = %Platform.Model.User{name: name, email: email, address: address, password: password}
	Platform.Repo.insert!(user)
    conn |> send_resp(200, "user with email #{email} has been added")
  end

  get "/:user_id" do
	case Platform.Repo.get(Platform.Model.User, user_id) do
	  nil ->
		conn |> send_resp(404, "User Not Found")
	  user ->
		page_content = show_user(user)
		conn
		|> put_resp_content_type("text/html")
		|> send_resp(200, page_content)
	end
  end

end
