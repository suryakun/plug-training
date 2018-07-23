defmodule Platform.Model.User do
  use Ecto.Model

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string
    field :address, :string

    timestamps
  end
end
