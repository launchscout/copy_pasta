defmodule CopyPastaWeb.PageController do
  use CopyPastaWeb, :controller
  alias CopyPastaWeb.Endpoint

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false, url: url)
  end

  defp url() do
    "#{String.replace(Endpoint.url(), "http:", "ws:")}/livestate"
    |> IO.inspect(label: "building livestate url")
  end
end
