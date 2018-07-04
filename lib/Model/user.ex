defmodule Platform.Model.User do
  use Ecto.Model

  schema "users" do
    field :first_name, :string
    field :last_name, :string

    timestamps
  end
end
