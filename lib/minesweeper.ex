defmodule Minesweeper do

  @type grid :: %{{integer, integer} => :mine | :safe | integer}

  @type t :: %Minesweeper{size: {integer, integer}, grid: grid}

  defstruct size: {0, 0}, grid: %{}

  def hello do
    :world
  end
end
