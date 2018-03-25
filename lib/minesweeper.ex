defmodule Minesweeper do
  use Application

  @reader Application.get_env(:kata_minesweeper, :reader)
  @writer Application.get_env(:kata_minesweeper, :writer)

  alias Minesweeper.Grid

  def sweep(path) do
    @reader.parse_grids(path)
    |> Enum.map(&(Grid.discover_hints(&1)))
    |> @writer.write_grids
  end


  def main(args) do
    sweep(parse_args(args)[:path])
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args, switches: [path: :string])
    options
  end
end
