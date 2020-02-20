defmodule WorldClocks.Time do

  defstruct name: "", time: ""

  def utc() do
    "UTC TIME"
  end

  def local() do
    "LOCAL TIME"
  end

  def get(country) do
    "Country Time"
  end
end
