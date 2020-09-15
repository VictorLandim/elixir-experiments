# pattern <- enumerable_thing

for(x <- [1, 2, 3], do: x * x)
|> IO.inspect()

for(x <- 1..10, rem(x, 3) == 0, do: x)
|> IO.inspect()

for(x <- 1..3, y <- 1..3, do: {x, y})
|> IO.inspect()

for(<<letter <- "Bits">>, do: letter)
|> IO.inspect()

for(<<letter <- "Bits">>, do: <<letter>>)
|> IO.inspect()

for(x <- ~w{ cat dog }, into: Map.new(), do: {x, String.upcase(x)})
|> IO.inspect()
