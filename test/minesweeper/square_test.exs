defmodule Minesweeper.SquareTest do
  use ExUnit.Case

  alias Minesweeper.Square

  test "an empty grid should have an empty list of adjacents" do
    adjacents = Square.adjacents({0,0}, {0,0})
    assert adjacents === []
  end

end