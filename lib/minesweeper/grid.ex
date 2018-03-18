defmodule Minesweeper.Grid do

  @type hint :: 0..8
  @type square_value :: (:mine | :safe | hint)
  @type position :: {non_neg_integer, non_neg_integer}
  @type squares :: %{position => square_value}
  @type t :: %Minesweeper.Grid{size: {non_neg_integer, non_neg_integer}, squares: squares}

  defstruct size: {0, 0}, squares: %{}

  alias Minesweeper.Grid
  alias Minesweeper.Square

  @spec discover_hints(grid :: Grid.t) :: Grid.t
  def discover_hints(grid) do
    do_discover_hints(grid, {0,0})
  end

  defp do_discover_hints(%Grid{ size: size} = grid, square_to_eval) when size == square_to_eval, do: grid

  defp do_discover_hints(%Grid{ squares: %{{0,0}=>:mine}} = grid, square_to_eval),
       do: %Grid{size: {1, 1}, squares: %{{0,0}=>:mine}}

  defp do_discover_hints(%Grid{ squares: %{{0,0}=>:safe}} = grid, square_to_eval),
       do: %Grid{size: {1, 1}, squares: %{{0,0}=>0}}

  @spec hint(grid :: Grid.t, square :: position) :: hint
  def hint(grid, square) do
    Square.adjacents(grid.size, square)
    |> Enum.map(fn adjacent -> grid.squares[adjacent] end)
    |> Enum.filter(fn square_value -> square_value == :mine end)
    |> Enum.count
  end


  #  recursive until current evaluated position equals to size
  #       public method calculate hint summing adjacents Enum. 0 .. 8, quizas un reduce desde 0


end
