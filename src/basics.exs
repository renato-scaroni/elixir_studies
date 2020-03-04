# example of pattern matching and with
content = "whatever"

lp = with {:ok, file} = File.open("/etc/passwd"),
        content = IO.read(file, :all),
        :ok = File.close(file),
        [_, uid, gid] = Regex.run(~r/^lp:.*?:(\d+):(\d+)/m, content)
    do
        "Group: #{gid}, User: #{uid}"
    end

IO.puts lp #=> Group: 26, User: 26
IO.puts content #=> Now is the time

# example of comparison. DONT DO THIS
if content == "whatever" do
    IO.puts "bla"
end

# messing around with lists and functions
defmodule Bla do
    def map([], _f), do: []
    def map([h|t], f), do: [f.(h)|map(t, f)]

    def print_int_list([]), do: :nothing
    def print_int_list([h|t]), do: print_int_list t, "[" <> Integer.to_string(h)
    def print_int_list([], s), do: IO.puts s<>"]"
    def print_int_list([h|t], s), do: print_int_list t, s <> ", " <> Integer.to_string(h)

    def add_1([]), do: []
    def add_1([h|t]), do: [h + 1| add_1(t)]

    def add_n([], _n), do: []
    def add_n([h|t], n), do: [h + n| add_n(t, n)]
end

# example of list comprehension
values = for i <- 1..10, do: i
Bla.print_int_list(values)
IO.inspect values

values
|> Bla.map(&Integer.to_string/1)
|> IO.inspect

values
|> Enum.map(&Integer.to_string/1)
|> IO.inspect


values
|> Bla.add_1
|> IO.inspect

values
|> Enum.reduce(fn (x, acc) -> x + acc end)
|> IO.inspect

values
|> Bla.add_n(100)
|> Enum.reduce(&(&1 + &2))
|> IO.inspect

# 
for n <- 1..3, times <- 1..n, do: IO.puts "#{n} - #{times}"