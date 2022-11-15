defmodule Task2PathTraversal do
@moduledoc """
  A module that implements functions for
  path planning algorithm and travels the path
  """

  @cell_map %{ 1 => [4],
                2 => [3, 5],
                3 => [2],
                4 => [1, 7],
                5 => [2, 6, 8],
                6 => [5, 9],
                7 => [4, 8],
                8 => [5, 7],
                9 => [6]
  }

  @matrix_of_sum [
    ["na","na", 15],
    ["na", "na", 12],
    ["na", 10, "na"]
  ]

  @doc """
  #Function name:
          get_locations
  #Inputs:
          A 2d matrix namely matrix_of_sum containing two digit numbers
  #Output:
          List of locations of the valid_sum which should be in ascending order
  #Details:
          To find the cell locations containing valid_sum in the matrix
  #Example call:
          Check Task 2 Document
  """
  def get_locations(matrix_of_sum \\ @matrix_of_sum) do
        matrix_of_sum
        |>List.flatten()
        |>Stream.with_index(1)
        |> Enum.reduce(%{}, fn({v,k}, acc)-> Map.put(acc, k, v) end)
        |>Map.filter(fn{_key, val} -> is_integer(val)==true and val >= 0 end)
        |>Enum.map(fn{k,_v} -> k end)
        |>Enum.sort()
  end


  @doc """
  #Function name:
          cell_traversal
  #Inputs:
          cell_map which contains all paths as well as the start and goal locations
  #Output:
          List containing the path from start to goal location
  #Details:
          To find the path from start to goal location
  #Example call:
          Check Task 2 Document
  """
def cell_traversal(cell_map,start,goal) do
        unvisited = Enum.map(cell_map,fn {k,_v} -> k  end)
        search({cell_map , goal},start,unvisited)
end

def search(data,node,unvisited,visited\\[]) do
        {graph,goal} = data
        cond do
        node == goal ->
          visited ++ [goal]
        true ->
            list = graph|> Map.fetch!(node)
            nlist = Enum.map(unvisited, fn x -> list|>Enum.filter(fn y -> y != x == false  end)  end)|>List.flatten()
            if nlist == [] do
              unvisited = unvisited|>List.delete(node)
              _node = visited|>List.last()
              back(data,visited,unvisited,list)
            else
              visited = visited ++ [node]
              unvisited = unvisited|>List.delete(node)
              node = nlist|>List.first
              search(data,node,unvisited,visited)
            end
        end
      end

      def back(data,visited,unvisited,list) do
        [h|_t] = list
        if visited|>Enum.count() != 1 do
          visited = visited|>Enum.take_while(fn x -> x != h end)
          t = visited|>List.last()
          visited = visited|>List.delete(t)
          search(data,t,unvisited,visited)
        else
          t = visited|>List.last()
          visited = []
          search(data,t,unvisited,visited)
        end
    end
  @doc """
  #Function name:
          traverse
  #Inputs:
          a list (this will be generated in grid_traversal function) and the cell_map
  #Output:
          List of lists containing paths starting from the 1st cell and visiting every cell containing valid_sum
  #Details:
          To find shortest path from first cell to all valid_sum’s locations
  #Example call:
          Check Task 2 Document
  """
  def traverse(list, cell_map) do
        cond do
                list|>Enum.count() > 2 ->
                        list = list|>Enum.chunk_every(2,1,[])|>Enum.filter(fn x -> x|>Enum.count() == 2 end)
                        Enum.map(list, fn x -> cell_traversal(cell_map,List.first(x),List.last(x)) end)
                list|>Enum.count() == 1 ->
                        list
                list|>Enum.count() == 2 ->
                        cell_traversal(cell_map,List.first(list),List.last(list))
        end
end
  @doc """
  #Function name:
          grid_traversal
  #Inputs:
          cell_map and matrix_of_sum
  #Output:
          List of keyword lists containing valid_sum locations along with paths obtained from traverse function
  #Details:
          Driver function which calls the get_locations and traverse function and returns the output in required format
  #Example call:
          Check Task 2 Document
  """
  def grid_traversal(cell_map \\ @cell_map,matrix_of_sum \\ @matrix_of_sum) do
    [1] ++ get_locations(matrix_of_sum)
    |> traverse(cell_map)
    |> Enum.map(fn path_list ->
        [{ Enum.at(path_list, -1)
           |> Integer.to_string()
           |> String.to_atom(), path_list}]
        end)
  end

end
