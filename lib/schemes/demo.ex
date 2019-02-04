defmodule Ninecrawl.Demo do
  use Ecto.Schema

  @derive {Poison.Encoder, except: [:__meta__]}
  schema "demo" do
    field(:name, :string)
    field(:active, :boolean)
    field(:gender, :string)
  end
end
