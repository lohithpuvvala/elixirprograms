defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    my_str = "My Sentence"
    IO.puts "Length : #{String.length(my_str)}" #finds the length of str
    longer_str = my_str <>" "<>"is longer" #concatinating a str-var with a str
    IO.puts "Equal : #{my_str === longer_str} " #checks equality

    IO.puts "My ? #{String.contains?(my_str, "My")}" #chekcs wether a char or str are in the main str

    IO.puts "Index 4: #{String.at(my_str, 4)}" #takes the value of the char at given index of the string

    IO.puts "Substring : #{String.slice(my_str, 3, 8)}" #makes a substring from the main string

    IO.inspect String.split(longer_str, " ")#split the string with respect to the priotitized element

    IO.puts String.reverse(longer_str) #reverses the str
    IO.puts String.upcase(longer_str) #upper cases the str
    IO.puts String.downcase(longer_str) #lower cases the str
    IO.puts String.capitalize(longer_str) #capitalizes the str

    4 * 10 |> IO.puts
  end
end
