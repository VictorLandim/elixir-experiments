# enum vs stream
# Enum.map(1..10_000_000, &(&1 + 1))
# |> Enum.take(5)
# |> IO.inspect()

IO.puts("Streams:")

Stream.map(1..10_000_000, &(&1 + 1))
|> Enum.take(5)
|> IO.inspect()

# cycle
IO.puts("Cycle:")

Stream.cycle(~w{ green white })
|> Stream.zip(1..5)
|> Enum.map(fn {class, value} -> "<tr class='#{class}'><td>#{value}</td></tr>\n" end)
|> IO.inspect()

# repeatedly
IO.puts("Repeatedly:")
# Stream.repeatedly(fn -> true end)
Stream.repeatedly(&:random.uniform/0)
|> Enum.take(5)
|> IO.inspect()

# iterate
IO.puts("Iterate:")

Stream.iterate(1, &(&1 * 2))
|> Enum.take(10)
|> IO.inspect()

# unfold
IO.puts("Unfold:")

Stream.unfold({0, 1}, fn {f1, f2} -> {f1, {f2, f1 + f2}} end)
|> Enum.take(15)
|> IO.inspect()

# resource
IO.puts("Resource:")

Stream.resource(
  fn -> File.open!("streams.exs") end,
  fn file ->
    case IO.read(file, :line) do
      data when is_binary(data) -> {[data], file}
      _ -> {:halt, file}
    end
  end,
  fn file -> File.close(file) end
)
|> Enum.take(5)
|> IO.inspect()
