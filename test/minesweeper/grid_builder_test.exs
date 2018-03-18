defmodule Minesweeper.GridBuilderTest do
  use ExUnit.Case

  alias Minesweeper.Grid
  alias Minesweeper.GridBuilder


  test "should create a list of grids from file" do
    grids = GridBuilder.create_grids_from_file "test/resources/simple_grid.txt"
    assert Enum.count(grids) == 1
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
end