defmodule Mineswepper.GridTest do
  use ExUnit.Case

  alias Minesweeper.Grid

  @empty_grid %Grid{}


  test "should hint with 'zero' when a square has no adjacents mines" do
    safe_grid = %Grid{
      size: {1, 1},
      squares: %{
        {0, 0} => :safe, {1, 0} => :safe,
        {0, 1} => :safe, {1, 1} => :safe
      }
    }
    hint = Grid.hint safe_grid, {0, 0}
    assert hint === 0
  end

  test "should hint with 'one' when a square has only one adjacent mine" do
    grid = %Grid{
      size: {2, 2},
      squares: %{
        {0, 0} => :safe, {1, 0} => :mine,
        {0, 1} => :safe, {1, 1} => :safe
      }
    }
    hint = Grid.hint grid, {0, 0}
    assert hint === 1
  end


  test "should hint with 'three' when a square has three adjacent mines" do
    grid = %Grid{
      size: {2, 2},
      squares: %{
        {0, 0} => :safe, {1, 0} => :mine,
        {0, 1} => :mine, {1, 1} => :mine
      }
    }
    hint = Grid.hint grid, {0, 0}
    assert hint === 3
  end

  test "should hint with 'eight' when a square is totally sorrounded by mines" do
    grid = %Grid{
      size: {3, 3},
      squares: %{
        {0, 0} => :mine, {1, 0} => :mine, {2, 0} => :mine,
        {0, 1} => :mine, {1, 1} => :safe, {2, 1} => :mine,
        {0, 2} => :mine, {1, 2} => :mine, {2, 2} => :mine
      }
    }
    hint = Grid.hint grid, {1, 1}
    assert hint === 8
  end

  test "in an empty grid should have empty discovered hints" do
    assert_raise ArgumentError, fn -> Grid.discover_hints(@empty_grid) end
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

  test "in a four squares grid with a single mine the discovered hints should have all 'one' value" do
   single_bomb_grid= %Grid{
      size: {2, 2},
      squares: %{{0, 0} => :mine, {1, 0} => :safe, {0, 1} => :safe, {1, 1} => :safe}
    }
   expected= %Grid{
     size: {2, 2},
     squares: %{{0, 0} => :mine, {1, 0} => 1, {0, 1} => 1, {1, 1} => 1}
   }
   hints =  Grid.discover_hints(single_bomb_grid)
   assert hints === expected
  end

  test "in a grid with some mines the discovered hints should have the expected values" do
    grid= %Grid{
      size: {4, 4},
      squares: %{
        {0, 0} => :mine, {1, 0} => :safe, {2, 0} => :safe, {3, 0} => :safe,
        {0, 1} => :safe, {1, 1} => :safe, {2, 1} => :safe, {3, 1} => :safe,
        {0, 2} => :safe, {1, 2} => :mine, {2, 2} => :safe, {3, 2} => :safe,
        {0, 3} => :safe, {1, 3} => :safe, {2, 3} => :safe, {3, 3} => :safe
      }
    }
    expected= %Grid{
      size: {4, 4},
      squares: %{
        {0, 0} => :mine, {1, 0} => 1, {2, 0} => 0, {3, 0} => 0,
        {0, 1} => 2,  {1, 1} => 2, {2, 1} => 1, {3, 1} => 0,
        {0, 2} => 1, {1, 2} => :mine, {2, 2} => 1, {3, 2} => 0,
        {0, 3} => 1, {1, 3} => 1, {2, 3} => 1, {3, 3} => 0
      }
    }

    hints =  Grid.discover_hints(grid)
    assert hints === expected
  end


end