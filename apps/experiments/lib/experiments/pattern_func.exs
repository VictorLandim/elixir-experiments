defmodule PatternFunc do
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)
  def gdc(x, 0), do: x
  def gdc(x, y), do: gdc(y, rem(x, y))
end
