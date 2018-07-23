defmodule Platform do

  use Platform.Macros.Router

  forward "/users", to: Platform.Router.User

  get "/" do
	page_content = EEx.eval_file("lib/Templates/index.eex", [])
	conn
		|> put_resp_content_type("text/html")
		|> send_resp(200, page_content)
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end

  def start do
    {:ok, repo} = Platform.Repo.start_link
    {:ok, pid} = Plug.Adapters.Cowboy.http __MODULE__, []
    {pid, repo}
  end

end
