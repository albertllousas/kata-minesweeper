defmodule Minesweeper.SquareTest do
  use ExUnit.Case

  alias Minesweeper.Square

  test "an {0,0} grid should have an empty list of adjacents" do
    adjacents = Square.adjacents({0,0}, {0,0})
    assert adjacents === []
  end

  test "in a {1,1} grid the unique posible square should have an empty list of adjacents" do
    adjacents = Square.adjacents({1,1}, {0,0})
    assert adjacents === []
  end

  test "an invalid square should have an empty list of adjacents" do
    adjacents = Square.adjacents({1,1}, {100,-100})
    assert adjacents === []
  end


#  not posible errors only negative grids
end