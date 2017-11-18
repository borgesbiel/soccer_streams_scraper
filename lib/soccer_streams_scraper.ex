defmodule SoccerStreamsScraper do
  def handle_response({:ok, %{body: body}}, url) do
    [url | body
           |> Floki.find(".title")
           |> Floki.attribute("href")]
  end

  def handle_response(_response, url) do
    [url]
  end

  def get_links() do
    url = "https://www.reddit.com/r/soccerstreams/"
    headers = []
    options = [follow_redirect: true]
    url
    |> HTTPoison.get(headers, options)
    |> handle_response(url)
  end
end
