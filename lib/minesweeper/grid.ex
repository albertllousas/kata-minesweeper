defmodule Minesweeper.Grid do

  @type hint :: 0..8
  @type square_value :: (:mine | :safe | hint)
  @type position :: {non_neg_integer, non_neg_integer}
  @type squares :: %{position => square_value}
  @type t :: %Minesweeper.Grid{size: {non_neg_integer, non_neg_integer}, squares: squares}

  defstruct size: {0, 0}, squares: %{}

  alias Minesweeper.Grid
  alias Minesweeper.Square

  @spec discover_hints(grid :: Grid.t) :: Grid.t
  def discover_hints(grid) do
    do_discover_hints(grid, {:next, {0, 0}})
  end

  defp do_discover_hints(result, {:out_of_grid}), do: result

  defp do_discover_hints(grid, {:next, square} = next) do
    case grid.squares[square] do
      :mine ->
        do_discover_hints(grid, Square.next(grid.size, square))
      :safe ->
        hint = hint(grid, square)
        updated_grid =  put_in(grid.squares[square], hint)
        do_discover_hints(updated_grid, Square.next(grid.size, square))
      _ ->
        raise ArgumentError, message: "invalid arguments #{grid} next: {#{elem(square,0)}, #{elem(square,1)}}"
    end
  end

  @spec hint(grid :: Grid.t, square :: position) :: hint
  def hint(grid, square) do
    Square.adjacents(grid.size, square)
    |> Enum.map(fn adjacent -> grid.squares[adjacent] end)
    |> Enum.filter(fn square_value -> square_value == :mine end)
    |> Enum.count
  end

  defimpl String.Chars, for: Grid do
    def to_string(%Grid{size: {x,y}, squares: squares }= grid) do
      squares_as_string = Enum.map(squares, fn {k, v} -> "{#{elem(k,0)}, #{elem(k,1)} => #{v}" end)
      "grid : {size: {#{x}, #{y}}, squares: #{squares_as_string}}"
    end
  end

end
