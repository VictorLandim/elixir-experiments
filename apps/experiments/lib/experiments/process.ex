defmodule Link do
  def sad_func do
    :timer.sleep(500)
    exit(:boom)
  end

  def happy_func do
    IO.puts("Happy func done.")
  end

  def run do
    # convert exit signal to message
    Process.flag(:trap_exit, true)
    spawn_link(Link, :sad_func, [])

    receive do
      msg -> IO.puts("Message received: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("Nothing came back!")
    end
  end
end

defmodule Monitor do
  def run do
    res = spawn_monitor(Link, :sad_func, [])
    IO.inspect(res)

    receive do
      msg -> IO.puts("Message received: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("Nothing came back!")
    end
  end
end

defmodule ProcessExercise do
  def func(pid) do
    send(pid, :msg)
    # exit(:normal)
    raise("RAISED ERROR")
  end

  def run do
    # spawn_link(ProcessExercise, :func, [self()])
    spawn_monitor(ProcessExercise, :func, [self()])

    :timer.sleep(500)

    receive do
      msg -> IO.puts("Message received: #{inspect(msg)}")
    end
  end
end

defmodule Parallel do
  def pmap(collection, fun) do
    me = self()

    collection
    # runs the given `func` in the `elem` in a separate process
    # then gets the returning `pid`
    |> Enum.map(fn elem ->
      spawn_link(fn ->
        send(me, {self(), fun.(elem)})
      end)
    end)
    # gets the result back to the corresponding process
    |> Enum.map(fn pid ->
      receive do
        {^pid, result} -> result
      end
    end)
  end
end
