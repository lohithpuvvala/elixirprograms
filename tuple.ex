defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    my_stats = {75, 5.7, :lohith}

    IO.puts "Tuple : #{is_tuple(my_stats)}"

    my_stats2 = Tuple.append(my_stats, 20)

    IO.puts "Age : #{elem(my_stats2, 3)}"

    IO.puts "Size : #{tuple_size(my_stats2)}"

    my_stats3 = Tuple.delete_at(my_stats2, 0)

    my_stats4 = Tuple.insert_at(my_stats3, 0, 73)

    many_zeroes = Tuple.duplicate(0,5)

    {weight, height, name} = {75, 6.25, "lohith"}
    IO.puts "Weight : #{weight}"


  end
end
