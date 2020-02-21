defmodule WorldClocks.Time do
  use Timex

  defstruct name: "", time: ""

  def utc() do
    Timex.now() |> Timex.format!("{h24}:{m}:{s}")
  end

  def local() do
    Timex.local() |> Timex.format!("{h24}:{m}:{s}")
  end

  def get(country) do
    Timex.now(country) |> Timex.format!("{h24}:{m}:{s}")
  end
end
