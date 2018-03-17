defmodule Mineswepper.GridTest do
  use ExUnit.Case

  alias Minesweeper.Grid

  @empty_grid %Grid{}


  test "in an empty grid should have empty discovered hints" do
    hints = Grid.discover_hints(@empty_grid)
    assert hints === @empty_grid
  end

  test "in a single square grid with a mine the discovered hint should have ':mine' value" do
    the_smallest_grid_with_a_mine= %Grid{
      size: {1, 1},
      squares: %{
        {0, 0} => :mine
      }
    }
    hints = Grid.discover_hints(the_smallest_grid_with_a_mine)
    assert hints === the_smallest_grid_with_a_mine
  end

  test "in a single square grid without mines the discovered hint should have 'zero' value" do
    the_smallest_safe_grid= %Grid{
      size: {1, 1},
      squares: %{
        {0, 0} => :safe
      }
    }
    grid_with_one_hint_as_zero= %Grid{
      size: {1, 1},
      squares: %{
        {0, 0} => 0
      }
    }
    hints = Grid.discover_hints(the_smallest_safe_grid)
    assert hints === grid_with_one_hint_as_zero
  end


end