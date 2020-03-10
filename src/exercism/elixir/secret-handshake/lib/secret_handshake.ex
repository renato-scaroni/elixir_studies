use Bitwise

defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @actions %{
    0b1 => "wink",
    0b10 => "double blink",
    0b100 => "close your eyes",
    0b1000 => "jump",
  }

  def reverse_list([]), do: []
  def reverse_list([h|t]) do
    reverse_list(t) ++ [h]
  end

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    c = for i <- [1, 2, 4, 8], (code &&& i) > 0, do: @actions[code &&& i]
    cond do
      (code &&& 0b10000) > 0 -> reverse_list(c)
      true -> c
    end
  end
end

# IO.inspect(SecretHandshake.reverse_list([1,2,3,4]))
IO.inspect(SecretHandshake.commands(10))
