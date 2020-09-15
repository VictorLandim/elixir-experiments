
# exercise
defmodule Stack.Server do
  use GenServer

  def init(initial_stack) do
    {:ok, initial_stack}
  end

  def handle_call(:pop, _from, [h | t]) do
    {:reply, h, t}
  end

  def handle_call(:pop, _from, []) do
    {:reply, [], []}
  end

  def handle_cast({:push, value}, _from, current_stack) do
    {:reply, current_stack, [value | current_stack]}
  end
end

