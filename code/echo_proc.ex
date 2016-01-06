defmodule EchoProc do
  # spawns a new process and returns its pid
  def new(name, attention_span) do
    spawn(fn() -> loop(name, attention_span) end)
  end

  # simple send/receive API
  def speak_at(pid, x) do
    # NOTE whatever process calls this function will be 'self()'
    # e.g., our console
    send(pid, {x, self()})
    receive do x -> x end
  end

  defp loop(name, attention_span) do
    receive do
      {:exit, _from} ->
        IO.puts("#{name} is shutting down")
        # no recursive call -> process finishes
      {x, from} ->
        IO.puts("#{name} got #{inspect x}")
        send(from, String.reverse(inspect x))
        loop(name, attention_span)
    after
      attention_span ->
        IO.puts("#{name}: I AM BORED")
        loop(name, attention_span)
    end
  end
end
