defmodule Minesweeper do

  @reader Application.get_env(:kata_minesweeper, :reader)
  @writer Application.get_env(:kata_minesweeper, :writer)

  alias Minesweeper.Grid

  def sweep(path) do
    @reader.parse_grids(path)
    |> Enum.map(&(Grid.discover_hints(&1)))
    |> @writer.write_grids
  end
end
