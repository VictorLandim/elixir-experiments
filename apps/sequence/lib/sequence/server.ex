# test debug:
# {:ok, pid} = GenServer.start_link(Sequence.Server, 100, [debug: [:trace]])
# {:ok, pid} = GenServer.start_link(Sequence.Server, 100, [debug: [:statistics]])

defmodule Sequence.Server do
  use GenServer

  @vsn "0"

  alias Sequence.Impl

  # GenServer implementation
  def init(_) do
    {:ok, Sequence.Stash.get()}
  end

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, Impl.next(current_number)}
  end

  def handle_call(_, _, current_number) do
    {:reply, current_number, current_number}
  end

  def handle_cast({:increment_number, delta}, current_number) do
    {:noreply, Impl.increment(current_number, delta)}
  end

  def format_status(_reason, [_pdict, state]) do
    [data: [{'State', "My current state is '#{inspect(state)}', and I'm happy"}]]
  end

  def terminate(_reason, current_number) do
    Sequence.Stash.update(current_number)
  end
end
