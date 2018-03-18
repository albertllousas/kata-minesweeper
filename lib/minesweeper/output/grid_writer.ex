defmodule Minesweeper.Output.GridWriter do
  alias Minesweeper.Grid

  @callback write_grids([Grid.t]) :: none

end