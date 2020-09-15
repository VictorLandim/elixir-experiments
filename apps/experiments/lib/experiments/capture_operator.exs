my_abs = &abs(&1)
my_abs.(-100) |> IO.inspect()

div_rem = &{div(&1, &2), rem(&1, &2)}
div_rem.(13, 5) |> IO.inspect()

s = &"Bacon and #{&1}"
s.("custard") |> IO.inspect()

match_end = &~r/.*#{&1}$/
("cat" =~ match_end.("t")) |> IO.inspect()
("cat" =~ match_end.("!")) |> IO.inspect()

l = &length/1
l.([1, 2, 3]) |> IO.inspect()

len = &Enum.count/1
len.([1, 2, 3, 4]) |> IO.inspect()

Enum.map([1, 2, 3, 4, 5], &(&1 + 2)) |> IO.inspect()

Enum.each([1, 2, 3, 4, 5], &IO.inspect/1)
