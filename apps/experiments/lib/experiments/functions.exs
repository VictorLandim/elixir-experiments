funcs_2 = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

funcs_3 = fn
  n -> funcs_2.(rem(n, 3), rem(n, 5), n)
end

funcs_3.(10) |> IO.puts()
funcs_3.(11) |> IO.puts()
funcs_3.(12) |> IO.puts()
funcs_3.(13) |> IO.puts()
funcs_3.(14) |> IO.puts()
funcs_3.(15) |> IO.puts()
funcs_3.(16) |> IO.puts()

funcs_4 = fn first -> fn second -> "#{first} #{second}" end end

mrs = funcs_4.("Mrs.")
mrs.("Smith") |> IO.puts()
funcs_4.("Elixir").("Rocks") |> IO.puts()

greeter = fn name, greeting ->
  fn
    ^name -> "#{greeting} #{name}!"
    _ -> "I don't know you."
  end
end

mr_valim = greeter.("José", "Oi!")
mr_valim.("José") |> IO.puts()
mr_valim.("Dave") |> IO.puts()
