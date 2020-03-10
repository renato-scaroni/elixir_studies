defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @translation %{
    65 => 'U',
    67 => 'G',
    84 => 'A',
    71 => 'C'
  }

  @spec to_rna([char]) :: [char]
  def to_rna([]), do: ''
  def to_rna([h|t]) do
    @translation[h] ++ to_rna(t)
  end

end

IO.inspect RnaTranscription.to_rna('ACTG')
