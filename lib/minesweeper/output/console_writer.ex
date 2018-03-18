defmodule Minesweeper.Output.ConsoleWriter do

  @behaviour Minesweeper.Input.GridParser
  alias Minesweeper.Grid

  @spec write_grids([Grid.t]) :: none
  def write_grids(_), do: []
end