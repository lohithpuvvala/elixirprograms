defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    list1 = [1,2,3]
    list2 = [4,5,6]

    list3 = list1 ++ list2

    list4 = list3 -- list1

    IO.puts 6 in list4

    [head | tail] = list3
    IO.puts "Head : #{head}"

    IO.write "Tail : "
    IO.inspect tail

    IO.inspect [97,98], charlists: :as_lists

    Enum.each tail, fn item ->
    IO.puts item
    end

    words = ['Random', 'Words', 'in a', 'list']
    Enum.each words, fn word ->
    IO.puts word
    end

    display_list(words)

    IO.puts display_list(List.delete(words,"in a"))
    IO.puts display_list(List.delete_at(words,1))

    IO.puts display_list(List.insert_at(words, 1,"Yeah"))

    IO.puts List.first(words)

    IO.puts List.last(words)

    my_stats = [name: "Lohith",weight: 73]


  end

  def display_list([word|words]) do
    IO.puts word
    display_list(words)
  end

  def display_list([]), do: nil
end
