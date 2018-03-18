defmodule Minesweeper.Square do

  @type position :: {non_neg_integer, non_neg_integer}
  @type size :: {non_neg_integer, non_neg_integer}

  @spec adjacents(grid_size :: size, square :: position) :: [position]
  def adjacents({size_x, size_y} = _grid_size, {x, y} = _square) do

    all_posible_neighbours =
      [{x - 1, y - 1}, {x, y - 1}, {x + 1, y - 1}, {x - 1, y}, {x + 1, y}, {x - 1, y + 1}, {x, y + 1}, {x + 1, y + 1}]

    Enum.filter(all_posible_neighbours, fn (neighbour) -> elem(neighbour, 0) < size_x  end)
    |> Enum.filter(fn (neighbour) -> elem(neighbour, 1) < size_y  end)
    |> Enum.filter(&(elem(&1, 0) >= 0 and elem(&1, 1) >= 0))

  end

  @spec next(grid_size :: size, current_square :: position) :: {:next, position} | {:out_of_grid}
  def next({size_x, size_y} = _grid_size, {x, y} = _square) do
    cond do
      x < size_x - 1 -> {:next, {x + 1, y}}
      y < size_y - 1 -> {:next, {0, y + 1}}
      true -> {:out_of_grid}
    end
  end

end

