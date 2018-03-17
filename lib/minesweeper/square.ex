defmodule Minesweeper.Square do

  @type position :: {non_neg_integer, non_neg_integer}
  @type size :: {non_neg_integer, non_neg_integer}

  @spec adjacents(grid_size :: size, square :: position) :: [position]
  def adjacents(grid_size, square) do

    {x, y} = square

    all_posible_neighbours =
      [{x - 1, y - 1},{x, y - 1},{x + 1, y - 1}, {x - 1, y},{x + 1, y }, {x - 1, y + 1},{x, y + 1},{x + 1, y + 1}]

    Enum.filter(all_posible_neighbours, fn(neighbour) -> elem(neighbour, 0) < elem(grid_size, 0)  end)
    |> Enum.filter( fn(neighbour) -> elem(neighbour, 0) >= 0  end )
    |> Enum.filter( fn(neighbour) -> elem(neighbour, 1) < elem(grid_size, 1)  end )
    |> Enum.filter( &(elem(&1, 1) >= 0) )

  end

  @spec next(grid_size :: size, current_square :: position) :: {:next, position} | {:out_of_grid}
  def next(grid_size, current_square) do
    {:out_of_grid}
  end

end

