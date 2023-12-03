defmodule CopyPastaWeb.CopyPastaChannel do
  @moduledoc false

  use LiveState.Channel, web_module: CopyPastaWeb

  alias Phoenix.PubSub
  alias LiveState.Event

  @impl true
  def init(_channel, _params, _socket) do
    PubSub.subscribe(CopyPasta.PubSub, "copy_pasta:mealtime")
    {:ok, %{}}
  end

  @impl true
  def handle_event("serve-dapasta", %{"pasta" => pasta}, state) do
    PubSub.broadcast(CopyPasta.PubSub, "copy_pasta:mealtime", {:pasta, pasta})
    {:noreply, state}
  end

  @impl true
  def handle_message({:pasta, pasta}, state) do
    {:reply, %Event{name: "eat-dapasta", detail: %{pasta: pasta}}, state}
  end

end
