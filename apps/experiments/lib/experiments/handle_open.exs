handle_open = fn
  {:ok, file} -> "First line: #{IO.read(file, :line)}"
  {_, error} -> "Error: #{:file.format_error(error)}"
end

# exists
IO.puts(handle_open.(File.open("lib/basics/types.ex")))
IO.puts(handle_open.(File.open("nonexistent")))
