defmodule Minesweeper.FileParserTest do
  use ExUnit.Case

  alias Minesweeper.Grid
  alias Minesweeper.FileParser


  test "should fail when a file with a malformed header is parsed" do
    assert_raise MatchError, fn -> FileParser.grids "test/resources/malformed_grid_size.txt" end
  end

  test "should fail when a file with a less grid rows as expected is parsed" do
    assert_raise FunctionClauseError, fn -> FileParser.grids "test/resources/less_rows_than_expected.txt" end
  end

  test "should fail when a file with a more squares than expected is parsed" do
    assert_raise RuntimeError, fn -> FileParser.grids "test/resources/more_squares_than_expected.txt" end
  end

  test "should create a list of one grid from file" do
    grids = FileParser.grids "test/resources/simple_grid.txt"
    assert Enum.count(grids) === 1
    assert Enum.at(grids, 0) === %Grid{
             size: {4, 4},
             squares: %{
               {0, 0} => :mine, {0, 1} => :safe, {0, 2} => :safe, {0, 3} => :safe,
               {1, 0} => :safe, {1, 1} => :safe, {1, 2} => :mine, {1, 3} => :safe,
               {2, 0} => :safe, {2, 1} => :safe, {2, 2} => :safe, {2, 3} => :safe,
               {3, 0} => :safe, {3, 1} => :safe, {3, 2} => :safe, {3, 3} => :safe
             }
           }
  end

  test "should create a list of two grids from file" do
    grids = FileParser.grids "test/resources/two_valid_grids.txt"
    assert Enum.count(grids) === 2
    assert Enum.at(grids, 0) === %Grid{
             size: {4, 4},
             squares: %{
               {0, 0} => :mine,
               {0, 1} => :safe,
               {0, 2} => :safe,
               {0, 3} => :safe,
               {1, 0} => :safe,
               {1, 1} => :safe,
               {1, 2} => :mine,
               {1, 3} => :safe,
               {2, 0} => :safe,
               {2, 1} => :safe,
               {2, 2} => :safe,
               {2, 3} => :safe,
               {3, 0} => :safe,
               {3, 1} => :safe,
               {3, 2} => :safe,
               {3, 3} => :safe
             }
           }

    assert Enum.at(grids, 1) === %Grid{
             size: {3, 5},
             squares: %{
               {0, 0} => :mine,
               {0, 1} => :safe,
               {0, 2} => :safe,
               {1, 1} => :safe,
               {1, 2} => :mine,
               {2, 0} => :safe,
               {2, 1} => :safe,
               {2, 2} => :safe,
               {3, 0} => :safe,
               {3, 1} => :safe,
               {3, 2} => :safe,
               {1, 0} => :mine,
               {4, 0} => :safe,
               {4, 1} => :safe,
               {4, 2} => :safe
             }
           }
  end

end