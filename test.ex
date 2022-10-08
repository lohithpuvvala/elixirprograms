defmodule M do
  def main do
    matrix_of_sum = [

    ]
    valid_sum(matrix_of_sum)
  end

  def valid_sum(matrix_of_sum) do
    list = List.flatten(matrix_of_sum)
    list
    |> Enum.filter(fn(x) -> is_integer(x) == true end)
  end
end
