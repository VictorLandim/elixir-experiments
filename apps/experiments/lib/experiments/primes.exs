defmodule Primes do
  def get(to) do
    list = Lists.span(2, to)
    for x <- list, rem(x, 1) == 0 and rem(x, x) == 0, do: x
  end
end
