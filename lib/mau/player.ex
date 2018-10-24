defmodule Mau.Player do
  defstruct uuid: nil, hand: []

  @me __MODULE__

  def new(hand) do
    %@me{
      uuid: UUID.uuid4(),
      hand: hand,
    }
  end
end
