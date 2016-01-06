defmodule EchoServer do
  use GenServer

  defmodule State do
    defstruct name: nil, attention_span: nil
  end

  ########
  # API

  def start_link(name, attention_span) do
    GenServer.start_link(__MODULE__, {name, attention_span})
  end

  def stop(pid) do
    GenServer.call(pid, :stop)
  end

  def speak_at(pid, x) do
    GenServer.call(pid, {:spoken_at, x})
  end

  #######
  # GenServer callbacks
  
  def init({name, attention_span}) do
    {:ok,
     %State{name: name, attention_span: attention_span},
     attention_span}   # timeout
  end

  def handle_call(:stop, _from, state) do
    {:stop, :normal, :ok, state}
  end
  def handle_call({:spoken_at, x}, _from, state) do
    IO.puts("#{state.name} got #{inspect x}")
    {:reply, String.reverse(inspect x), state, state.attention_span}
  end

  def handle_info(:timeout, state) do
    IO.puts("#{state.name}: I AM BORED")
    {:noreply, state, state.attention_span}
  end

  def terminate(reason, state) do
    IO.puts("#{state.name} is shutting down because #{inspect reason}")
    :ok
  end
end
