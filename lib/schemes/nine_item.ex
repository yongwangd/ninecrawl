defmodule Ninecrawl.NineItem do
  use Ecto.Schema

  @derive {Poison.Encoder, except: [:__meta__]}
  schema "nine_one_videos" do
    field(:viewKey, :string)
    field(:title, :string)
    field(:videoUrl, :string)
    field(:downloaded, :boolean)
    field(:dead, :boolean)
    field(:site, :string)
    field(:downloadedTime, :utc_datetime)
  end
end
