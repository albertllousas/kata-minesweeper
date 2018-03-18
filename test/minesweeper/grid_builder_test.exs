defmodule Minesweeper.GridBuilderTest do
  use ExUnit.Case

  alias Minesweeper.GridBuilder

  test "should create a list of grids from file" do
    grids = GridBuilder.create_grids_from_file "simple_grid.txt"
    assert Enum.count(grids) == 1
  end
end