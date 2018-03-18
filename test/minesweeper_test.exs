defmodule MinesweeperTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "should sweep and print in output the expected grids with hints" do

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
