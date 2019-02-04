defmodule Ninecrawl.Crawler do
  import Ecto.Query
  alias Ninecrawl.Repo
  alias Ninecrawl.NineItem

  def main(_args) do
    videos = not_download_videos()
    IO.inspect(videos)

    Enum.each(videos, fn x -> download_video(x) end)
  end

  defp not_download_videos() do
    Repo.all(
      from(u in NineItem,
        where: u.downloaded == false and u.dead == false and u.site == "91",
        limit: 10,
        order_by: fragment("rand()"),
        select: u
      )
    )
  end

  defp download_video(item) do
    case System.cmd("youtube-dl", [item.videoUrl], cd: "/data/mysecrets/myfavor") do
      {res, 0} ->
        IO.inspect(res)
        Repo.update(Ecto.Changeset.change(item, %{downloaded: true}))

      {res, 1} ->
        IO.puts(res)

        if String.contains?(res, "extract title") do
          IO.puts("Unable to extract title, mark as DEAD")
          Repo.update(Ecto.Changeset.change(item, %{dead: true, downloaded: false}))
        end
    end
  end
end
