defmodule Sequence.Application do
  @moduledoc false
  use Application

  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    children = [
      {Sequence.Stash, Application.get_env(:sequence, :initial_number)},
      {Sequence, nil}
    ]

    opts = [
      strategy: :rest_for_one,
      name: Sequence.Supervisor
    ]

    Supervisor.start_link(children, opts)
  end
end
