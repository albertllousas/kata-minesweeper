defmodule Minesweeper.Output.ConsoleWriterTest do
  use ExUnit.Case

  alias Minesweeper.Grid
  alias Minesweeper.Output.ConsoleWriter

  import ExUnit.CaptureIO

  test "should print in console output an empty list of grids" do
    assert capture_io(fn -> ConsoleWriter.write_grids([]) end) == ""
  end

end