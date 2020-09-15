defmodule Lists do
  def mapsum([], _), do: 0

  def mapsum([h | t], fun) do
    fun.(h) + mapsum(t, fun)
  end

  def span(to, to), do: [to]

  def span(from, to) do
    [from | span(from + 1, to)]
  end
end
