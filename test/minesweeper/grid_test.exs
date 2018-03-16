defmodule Mineswepper.GridTest do
  use ExUnit.Case

  alias Minesweeper.Grid

  @empty_grid %Grid{}


  test "should create a empty grid discovering hints on empty grid" do
    hints = Grid.discover_hints(@empty_grid)
    assert hints === @empty_grid
  end

  test "should not discover any hints when there are only one square with a mine" do
    the_smallest_grid_with_a_mine= %Grid{
      size: {1, 1},
      squares: %{
        {0, 0} => :mine
      }
    }
    hints = Grid.discover_hints(the_smallest_grid_with_a_mine)
    assert hints === the_smallest_grid_with_a_mine
  end
  test "should not discover one zero hint when there are only one square with a safe square" do
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