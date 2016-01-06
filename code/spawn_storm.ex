defmodule SpawnStorm do
  def go(n) do
    (1..n)
    |> Enum.map(fn(_) -> 1000 + :random.uniform(2000) end)
    |> Enum.each(fn(t) ->
      spawn(fn() ->
        :timer.sleep(t)
        IO.puts("HI #{t}")
      end)
    end)
  end
end
