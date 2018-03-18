defmodule Minesweeper.Output.ConsoleWriter do

  @behaviour Minesweeper.Output.GridWriter
  alias Minesweeper.Grid

  @spec write_grids([Grid.t]) :: none
  def write_grids(grids) do

    for {grid, index} <- Enum.with_index(grids, 1) do

      {rows, columns} = grid.size
      IO.puts "Field ##{index}:"

      for y <- 0 .. (rows - 1) do
        row = for x <- 0 .. (columns - 1), do: grid.squares[{x,y}]
        IO.puts Enum.join(row) |> String.replace( "mine", "*")
      end

      IO.puts ""
    end

  end

end