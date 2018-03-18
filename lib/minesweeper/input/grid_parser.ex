defmodule Minesweeper.Input.GridParser do
  alias Minesweeper.Grid

  @callback parse_grids(path :: String.t) :: [Grid.t]

end