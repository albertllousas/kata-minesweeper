defmodule Minesweeper.Grid do

  @type hint :: 0..8
  @type square :: (:mine | :safe | hint)
  @type position :: {non_neg_integer, non_neg_integer}
  @type squares :: %{position => square}
  @type t :: %Minesweeper.Grid{size: {integer, integer}, squares: squares}

  defstruct size: {0, 0}, squares: %{}

  alias Minesweeper.Grid

  @spec discover_hints(grid :: Grid.t) :: Grid.t
  def discover_hints(grid) do
    do_discover_hints(grid, {0,0})
  end

  defp do_discover_hints(%Grid{ size: size} = grid, square_to_eval) when size == square_to_eval, do: grid

  defp do_discover_hints(%Grid{ squares: %{{0,0}=>:mine}} = grid, square_to_eval),
       do: %Grid{size: {1, 1}, squares: %{{0,0}=>:mine}}

  defp do_discover_hints(%Grid{ squares: %{{0,0}=>:safe}} = grid, square_to_eval),
       do: %Grid{size: {1, 1}, squares: %{{0,0}=>0}}


  #  recursive until current evaluated position equals to size
  #       public method calculate hint summing adjacents
  # nextSquare(grid size, current square)

end
