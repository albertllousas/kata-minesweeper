defmodule Minesweeper.Output.ConsoleWriterTest do
  use ExUnit.Case

  alias Minesweeper.Grid
  alias Minesweeper.Output.ConsoleWriter

  import ExUnit.CaptureIO

  test "should print in console output an empty list of grids" do
    assert capture_io(fn -> ConsoleWriter.write_grids([]) end) == ""
  end

  test "should print in console output a single grid with for squares" do

    grid = %Grid{
      size: {2, 2},
      squares: %{
        {0, 0} => :mine, {1, 0} => 1,
        {0, 1} => 1, {1, 1} => 1
      }
    }
    assert capture_io(fn -> ConsoleWriter.write_grids([grid]) end) == ""
  end

end