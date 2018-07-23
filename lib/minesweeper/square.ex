defmodule Minesweeper.Square do

  @type position :: {non_neg_integer, non_neg_integer}
  @type size :: {non_neg_integer, non_neg_integer}

  @spec adjacents(grid_size :: size, square :: position) :: [position]
  def adjacents(grid_size, square) do

    {rows, columns} = grid_size
    {x, y} = square

    all_posible_neighbours =
      [{x - 1, y - 1}, {x, y - 1}, {x + 1, y - 1}, {x - 1, y}, {x + 1, y}, {x - 1, y + 1}, {x, y + 1}, {x + 1, y + 1}]

    inside_the_board = fn (neighbour) -> elem(neighbour, 0) < rows && elem(neighbour, 1) < columns end
    positive_values = &(elem(&1, 0) >= 0 and elem(&1, 1) >= 0)

    Enum.filter(all_posible_neighbours, inside_the_board)
    |> Enum.filter(positive_values)

  end

  @spec next(grid_size :: size, current_square :: position) :: {:next, position} | {:end}
  def next(grid_size, square) do
    {rows, columns} = grid_size
    {x, y} = square
    cond do
      x < columns - 1 -> {:next, {x + 1, y}}
      y < rows - 1 -> {:next, {0, y + 1}}
      true -> {:end}
    end
  end

end

