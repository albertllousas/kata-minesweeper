defmodule MinesweeperTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "should parse a file, sweep the grid and print into the output the hints" do

    assert capture_io(fn -> Minesweeper.sweep "test/resources/two_valid_grids.txt" end) == """
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
