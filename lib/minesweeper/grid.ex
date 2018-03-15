defmodule Minesweeper.Grid do

  @type hint :: 0..8
  @type square :: (:mine | :safe | hint)
  @type position :: {non_neg_integer, non_neg_integer}
  @type squares :: %{position => square}
  @type t :: %Minesweeper.Grid{size: {integer, integer}, squares: squares}

  defstruct size: {0, 0}, squares: %{}

  alias Minesweeper.Grid

  @spec sweep_for_hints(grid :: Grid.t) :: Grid.t
  def sweep_for_hints(grid) do
    %Grid{}
  end


end
