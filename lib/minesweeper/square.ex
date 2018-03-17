defmodule Minesweeper.Square do

  @type position :: {non_neg_integer, non_neg_integer}
  @type size :: {non_neg_integer, non_neg_integer}

  @spec adjacents(grid_size :: size, current_square :: position) :: [position]
  def adjacents(grid_size, current_square) do
    []
  end

#  @spec next(grid_size :: position, current_square :: position) :: position
#  def next(grid_size, current_square) do
#
#  end

end

