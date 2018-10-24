# Lives in the GenServer
defmodule Mau.Game do
  defstruct players: nil

  alias Mau.{Game, Ring}

  def start(%{players: players) do
    %Game{players: Ring.new(players)}
  end
end
