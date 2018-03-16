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
    do_discover_hints(grid)
  end

  defp do_discover_hints(%Grid{size: {0, 0}, squares: %{}}), do: %Grid{}

  defp do_discover_hints( %Grid{size: {1, 1}, squares: %{{0,0}=>:mine}}),
       do: %Grid{size: {1, 1}, squares: %{{0,0}=>:mine}}

  defp do_discover_hints( %Grid{size: {1, 1}, squares: %{{0,0}=>:safe}}),
       do: %Grid{size: {1, 1}, squares: %{{0,0}=>0}}

end
