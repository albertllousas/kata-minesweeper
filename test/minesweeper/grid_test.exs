defmodule Mineswepper.GridTest do
  use ExUnit.Case

  alias Minesweeper.Grid

  test "should create a empty grid sweeping for hints on empty grid" do
      hints = Grid.sweep_for_hints(%Grid{})
      assert hints === %Grid{}
  end

end