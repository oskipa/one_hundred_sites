defmodule WorldClocksWeb.TimeLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
      UTC: <%= @utc %> <br />
      Local: <%= @local %><br />
      <%= @country.name  %> : <%= @country.time %>
    """
  end

  def mount(_params, %{"country_name" => country_name},  socket) do
      IO.puts "Mounting"
      :timer.send_interval(10000, self(), :update)
    if connected?(socket) do
      IO.puts "connected. Setting timer."
    end
    
    {:ok, assign(socket, time_state(country_name))} 
  end

  def handle_info(:update, socket) do
    IO.puts "hitting info"
    {:no_replay, assign(socket, time_state(socket.assigns_country_name))}
  end

  def time_state(country_name) do
    [{:country_name, country_name} | get_times(country_name) ] 
  end

  def get_times(country) do
      [utc: WorldClocks.Time.utc, 
      local: WorldClocks.Time.local,
      country: %WorldClocks.Time{
        name: country, 
        time: WorldClocks.Time.get(country)}
      ]
  end


end
