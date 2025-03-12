defmodule SvelteDemoWeb.SvelteLive do
  use SvelteDemoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, counter: 0)}
  end

  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <div>
      <h1 class="text-center text-9xl">
        {@counter}
      </h1>

      <button phx-click="increment">Increment</button>
      <button phx-click="decrement">Decrement</button>
      <button phx-click="reset">Reset</button>
    </div>
    """
  end

  def handle_event("increment", _unsigned_params, socket) do
    {:noreply, assign(socket, counter: socket.assigns.counter + 1)}
  end

  def handle_event("decrement", _unsigned_params, socket) do
    {:noreply, assign(socket, counter: socket.assigns.counter - 1)}
  end

  def handle_event("reset", _unsigned_params, socket) do
    {:noreply, assign(socket, counter: 0)}
  end
end
