defmodule WorldClocksWeb.TimeLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
      <div class="clock"> <span class="time-name"> UTC:</span> <span class="clock-face"><%= @utc %></span> </div> 
      <div class="clock" > <span class="time-name" > Local: </span> <span class="clock-face"><%= @local %></span> </div>
      <div class="clock" > <span class="time-name" > <%= "ETC/GMT #{@country.offset}"  %> : </span> <span class="clock-face"><%= @country.time %></span> </div>
      <p></p>
      <button phx-click="inc_timezone">Increment Timezone</button>
      <button phx-click="dec_timezone">Decrement Timezone</button>
    """
  end

  def mount(_params, %{"offset" => offset},  socket) do
      IO.puts "Mounting"
    if connected?(socket) do
      IO.puts "connected. Setting timer."
      :timer.send_interval(1000, self(), :update)
    end
    
    {:ok, assign(socket, time_state(offset))} 
  end

  def handle_info(:update, socket) do
    {:noreply, assign(socket, time_state(socket.assigns.offset))}
  end

  def handle_event("inc_timezone", _value, socket ) do
    {:noreply, assign(socket, time_state(WorldClocks.Time.increment(socket.assigns.offset)))}
  end

  def handle_event("dec_timezone", _value, socket ) do
    {:noreply, assign(socket, time_state(WorldClocks.Time.decrement(socket.assigns.offset)))}
  end

  def time_state(offset) do
    [{:offset, offset} | get_times(offset) ] 
  end

  def get_times(offset) do
      [utc: WorldClocks.Time.utc, 
      local: WorldClocks.Time.local,
      country: %WorldClocks.Time{
        offset: offset,
        time: WorldClocks.Time.get(offset)}
      ]
  end
end
