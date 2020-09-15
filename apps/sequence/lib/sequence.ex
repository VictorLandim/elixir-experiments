defmodule Sequence do
  @server Sequence.Server

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end

  def start_link(_) do
    GenServer.start_link(@server, nil, name: @server)
  end

  def next_number do
    GenServer.call(@server, :next_number)
  end

  def increment_number(delta) do
    GenServer.cast(@server, {:increment_number, delta})
  end
end
