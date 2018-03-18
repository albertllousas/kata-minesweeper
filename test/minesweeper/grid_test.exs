defmodule Mineswepper.GridTest do
  use ExUnit.Case

  alias Minesweeper.Grid

  @empty_grid %Grid{}


  test "in an empty grid should have empty discovered hints" do
    hints = Grid.discover_hints(@empty_grid)
    assert hints === @empty_grid
  end

  test "in a single square grid with a mine the discovered hint should have ':mine' value" do
    the_smallest_grid_with_a_mine = %Grid{
      size: {1, 1},
      squares: %{
        {0, 0} => :mine
      }
    }
    hints = Grid.discover_hints(the_smallest_grid_with_a_mine)
    assert hints === the_smallest_grid_with_a_mine
  end

  test "in a single square grid without mines the discovered hint should have 'zero' value" do
    the_smallest_safe_grid = %Grid{
      size: {1, 1},
      squares: %{
        {0, 0} => :safe
      }
    }
    expected = %Grid{
      size: {1, 1},
      squares: %{
        {0, 0} => 0
      }
    }
    hints = Grid.discover_hints(the_smallest_safe_grid)
    assert hints === expected
  end

  #  test "in a four squares grid with a single mine the discovered hints should have all 'one' value" do
  #   single_bomb_grid= %Grid{
  #      size: {1, 1},
  #      squares: %{{0, 0} => :bomb, {1, 0} => :safe, {0, 1} => :safe, {1, 1} => :safe}
  #    }
  #   expected= %Grid{
  #     size: {1, 1},
  #     squares: %{{0, 0} => :bomb, {1, 0} => 1, {0, 1} => 1, {1, 1} => 1}
  #   }
  #   hints =  Grid.discover_hints(single_bomb_grid)
  #   assert hints === expected
  #  end

  test "should hint as 'zero' when a square has no adjacents mines" do
    safe_grid = %Grid{
      size: {1, 1},
      squares: %{
        {0, 0} => :safe,
        {1, 0} => :safe,
        {0, 1} => :safe,
        {1, 1} => :safe
      }
    }
    hint = Grid.hint safe_grid, {0, 0}
    assert hint === 0
  end


end