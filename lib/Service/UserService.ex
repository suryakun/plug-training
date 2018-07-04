defmodule Platform.Service.User do
  alias Platform.Repo
  alias Platform.Model.User

  def create(user \\ %User{}) do
    Repo.insert!(user)
  end

  def getById(id) do
    user = Repo.get(User, id)
    user
  end
end

