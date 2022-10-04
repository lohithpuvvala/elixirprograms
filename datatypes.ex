defmodule M do
  def main do
    data_stuff()
  end

  def data_stuff do
    my_int = 123
    IO.puts "Interger #{is_integer(my_int)}" #check  var = integer or not
    my_float = 3.1413
    IO.puts "Float #{is_float(my_float)}" #checks var = float or not
    IO.puts "Atom #{is_atom(:lohith)}" # checks var = atom or not # atom without spaces
    IO.puts "Atom #{is_atom(:"lohith puvvala")}" #atom with spaces

    one_to_10 = 1..10 #ranges from 1 to 10
  end
end
