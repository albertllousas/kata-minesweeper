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
    assert capture_io(fn -> ConsoleWriter.write_grids([grid]) end) == "Field #1:\n*1\n11\n\n"
  end

  test "should print in console output a couple of grids" do

   grid1 = %Grid{
             size: {4, 4},
             squares: %{
               {0, 0} => :mine, {1, 0} => 1, {2, 0} => 0, {3, 0} => 0,
               {0, 1} => 2, {1, 1} => 2, {2, 1} => 1, {3, 1} => 0,
               {0, 2} => 1, {1, 2} => :mine, {2, 2} => 1, {3, 2} => 0,
               {0, 3} => 1, {1, 3} => 1, {2, 3} => 1, {3, 3} => 0
             }
           }

    grid2 = %Grid{
             size: {3, 5},
             squares: %{
               {0, 0} => :mine, {1, 0} => :mine, {2, 0} => 1, {3, 0} => 0, {4, 0} => 0,
               {0, 1} => 3, {1, 1} => 3, {2, 1} => 2, {3, 1} => 0, {4, 1} => 0,
               {0, 2} => 1, {1, 2} => :mine, {2, 2} => 1, {3, 2} => 0, {4, 2} => 0
             }
           }

    assert capture_io(fn -> ConsoleWriter.write_grids([grid1, grid2]) end) == """
           Field #1:
           *100
           2210
           1*10
           1110

           Field #2:
           **100
           33200
           1*100

           """
  end

end