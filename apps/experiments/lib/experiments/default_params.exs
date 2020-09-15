defmodule Params do
  # defaults apply to all function bodies
  def func(p1, p2 \\ 123)

  def func(p1, p2) when is_list(p1) do
    "You said #{p2} with a list!"
  end

  def func(p1, p2) do
    "You passed #{p1} and #{p2}!"
  end

  def midpoint(l, h), do: div(l + h, 2)

  # def guess(actual, actual.._) do
  #   IO.puts("Is it #{actual}")
  # end

  # def guess(actual, _..actual) do
  #   IO.puts("Is it #{actual}")
  # end
    -> 
  def msg(l, h), do: IO.puts("Is it #{div(l + h, 2)}")

  def guess(actual, l..h) when actual == div(l + h, 2) do
    IO.puts(actual)
  end

  def guess(actual, l..h) when actual < div(l + h, 2) do
    msg(l, h)
    guess(actual, l..midpoint(l, h))
  end

  def guess(actual, l..h) when actual > div(l + h, 2) do
    msg(l, h)
    guess(actual, midpoint(l, h)..h)
  end
end
