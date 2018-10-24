# Ring buffer-ish
#
# This naive ring buffer implementation is not suitable for hot code paths. It uses a list
# of which the head is consumed and appended to the _end_ of the list, which is an
# expensive operation. In the context of Mau, the Ring will be used to model the game's
# players. The shift function is only called as a player ends their turn.
defmodule Mau.Ring do
  defstruct buffer: []

  @me Mau.Ring

  def new(elements) do
    %@me{buffer: elements}
  end

  def shift(%{buffer: [head | tail]} = ring) do
    %{ring | buffer: tail ++ [head]}
  end

  def peek(%{buffer: [head | _]}) do
    head
  end

  def shift_and_peak(ring) do
    shifted = @me.shift(ring)
    head = @me.peek(shifted)
    {shifted, head}
  end
end
