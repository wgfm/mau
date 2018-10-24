defmodule Mau.Server do
  use GenServer

  alias Mau.Game

  @me __MODULE__

  def start_link(params) do
    GenServer.start_link(@me, Game.start(params))
  end

  # Server callbacks

  @impl true
  def init(game) do
    {:ok, game}
  end
end
