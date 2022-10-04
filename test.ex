defmodule M do
  def enum do
    R = Enum.map([1,2,3],fn x -> x*2 end)
    IO.puts "Result : #{R}"
  end
end
