defmodule Minesweeper.GridBuilder do

  alias Minesweeper.Grid

  @spec create_grids_from_file(path :: String.t) :: [Grid.t]
  def create_grids_from_file(path) do
    file = File.open!(path)
    parse_grids(IO.read(file, :line), file)
  end

  defp parse_grids(:eof, file), do: []

  defp parse_grids(size_line, file) do
    {x, y} = parse_grid_size(size_line)
    lines = Enum.map(1..y, fn _ -> IO.read(file, :line) end)
    [create_board({x, y}, lines) | parse_grids(IO.read(file, :line), file)]
  end

  defp parse_grid_size(size_line) do
    size_line
    |> String.trim
    |> String.split
    |> Enum.map(&(String.to_integer(&1)))
    |> List.to_tuple
  end

  defp create_board(size, board_lines) do

    entries = for {line, y} = line_with_index <- Enum.with_index board_lines do
      line
      |> String.trim
      |> String.graphemes
      |> Enum.with_index
#      |> IO.inspect
      |> Enum.map(fn {char, x} -> {{x, y},square_value(char)} end)
    end
    IO.inspect entries
    squares = entries
    |> List.foldl([], &(&1 ++ &2))
    |> Map.new

    %Grid{size: size, squares: squares}
  end

  defp square_value(character) do
    case character do
      "*" -> :mine
      "." -> :safe
    end
  end

end