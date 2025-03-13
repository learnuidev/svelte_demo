defmodule SvelteDemoWeb.SvelteLive do
  use SvelteDemoWeb, :live_view

  defp subscribe() do
    Phoenix.PubSub.subscribe(SvelteDemo.PubSub, "counter")
  end

  defp broadcast(value) do
    Phoenix.PubSub.broadcast(SvelteDemo.PubSub, "counter", value)
  end

  @spec mount(any(), any(), Phoenix.LiveView.Socket.t()) :: {:ok, any()}
  def mount(_params, _session, socket) do
    if connected?(socket) do
      subscribe()
    end

    {:ok, assign(socket, counter: 0)}
  end

  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <.svelte name="counter" props={%{counter: @counter}} />
    """
  end

  def handle_event("increment", _unsigned_params, socket) do
    broadcast({:counter, socket.assigns.counter + 1})
    {:noreply, socket}
  end

  def handle_event("decrement", _unsigned_params, socket) do
    broadcast({:counter, socket.assigns.counter - 1})
    {:noreply, socket}
  end

  def handle_event("reset", _unsigned_params, socket) do
    broadcast({:counter, 0})
    {:noreply, socket}
  end

  def handle_info({:counter, counter}, socket) do
    {:noreply, assign(socket, counter: counter)}
  end
end
