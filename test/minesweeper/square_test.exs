defmodule Minesweeper.SquareTest do
  use ExUnit.Case

  alias Minesweeper.Square

  test "a no-size grid should have an empty list of adjacents" do
    adjacents = Square.adjacents({0, 0}, {0, 0})
    assert adjacents === []
  end

  test "in a minimum size grid the unique posible square should have an empty list of adjacents" do
    adjacents = Square.adjacents({1, 1}, {0, 0})
    assert adjacents === []
  end

  test "an invalid square should have an empty list of adjacents" do
    adjacents = Square.adjacents({1, 1}, {100, -100})
    assert adjacents === []
  end

  test "in a standard grid, a square in the top left corner should have three adjacents" do
    adjacents = Square.adjacents({3, 3}, {0, 0})
    assert adjacents === [{1, 0}, {0, 1}, {1, 1}]
  end

  test "in a standard grid, a square in the top right corner should have three adjacents" do
    adjacents = Square.adjacents({3, 3}, {2, 0})
    assert adjacents === [{1, 0}, {1, 1}, {2, 1}]
  end

  test "in a standard grid, a square in the bottom left corner should have three adjacents" do
    adjacents = Square.adjacents({4, 4}, {0, 3})
    assert adjacents === [{0, 2}, {1, 2}, {1, 3}]
  end

  test "in a standard grid, a square in the bottom right corner should have three adjacents" do
    adjacents = Square.adjacents({5, 5}, {4, 4})
    assert adjacents === [{3, 3}, {4, 3}, {3, 4}]
  end

  test "in a standard grid, a square in the top-half boundary should have five adjacents" do
    adjacents = Square.adjacents({5, 4}, {3, 0})
    assert adjacents === [{2, 0}, {4, 0}, {2, 1}, {3, 1}, {4, 1}]
  end

  test "in a standard grid, a square in middle should have eight adjacents" do
    adjacents = Square.adjacents({10, 10}, {3, 3})
    assert adjacents === [{2, 2}, {3, 2}, {4, 2}, {2, 3}, {4, 3}, {2, 4}, {3, 4}, {4, 4}]
  end

  test "in a non size grid should not be a next square" do
    next = Square.next({0, 0}, {0, 0})
    assert next === {:out_of_grid}
  end

  test "in a standard grid, the next square of a square in the middle is the one at right" do
    next = Square.next({5, 5}, {3, 3})
    assert next === {:next, {4, 3}}
  end

  test "in a standard grid, the next square of a square in the left boundary is the first on the row below" do
    next = Square.next({5, 5}, {4, 3})
    assert next === {:next, {0, 4}}
  end

  test "in a standard grid, the next square of the square in the bottom right corner is out of the grid" do
    next = Square.next({5, 5}, {4, 4})
    assert next === {:out_of_grid}
  end

  test "in a standard grid, the next square of an invalid square will be out of the grid" do
    next = Square.next({5, 5}, {6, 6})
    assert next === {:out_of_grid}
  end

  test "in a four squares grid, the next square of bottom right square is the one at bottom left" do
    next = Square.next({2, 2}, {0, 1})
    assert next === {:next, {1, 1}}
  end

end