defmodule Minesweeper.Input.GridParser do
  alias Minesweeper.Grid

  @callback parse_grids(string :: String.t) :: [Grid.t]

end