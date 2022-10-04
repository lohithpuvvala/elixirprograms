defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    IO.puts "4 ==  4.0 : #{4 == 4.0} "
    IO.puts "4 ===  4.0 : #{4 === 4.0} "
    IO.puts "4 !=  4.0 : #{4 != 4.0} "
    IO.puts "4 !==  4.0 : #{4 !== 4.0} "

    IO.puts "5 > 4 : #{5 > 4}"
    IO.puts "5 >= 4 : #{5 >= 4}"
    IO.puts "5 < 4 : #{5 < 4}"
    IO.puts "5 <= 4 : #{5 <= 4}"

    age = 16
    IO.puts "Vote & Drive : #{(age >= 16) and (age >= 18)}"
    IO.puts "Vote & Drive : #{(age >= 16) or (age >= 18)}"

    IO.puts not true
  end
end
