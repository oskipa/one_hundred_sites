defmodule WorldClocks.Time do
  use Timex

  defstruct name: "", offset: 0,  time: ""

  def increment(offset) do
    IO.puts("increment #{offset}")
    new_offset = offset + 1

    cond do
      new_offset > 14 -> -10
      true            -> new_offset 
    end
  end

  def decrement(offset) do
    IO.puts("decrement #{offset}")
     new_offset = offset - 1
   
    cond do
      new_offset < -12 -> 12
      true            -> new_offset 
    end
  end

  def utc() do
    Timex.now() |> Timex.format!("{h24}:{m}:{s}")
  end

  def local() do
    Timex.local() |> Timex.format!("{h24}:{m}:{s}")
  end

  def get(offset) do
    Timex.now(offset) |> Timex.format!("{h24}:{m}:{s}")
  end
end
