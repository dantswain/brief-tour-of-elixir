defmodule StreamExamples do
  # The logistic stream is chaotic for r between ~ 3.57 and 4
  # see https://en.wikipedia.org/wiki/Logistic_map
  def logistic_stream(r, initial_value) do
    iterator = fn(x) -> r * x * (1 - x) end
    Stream.iterate(initial_value, iterator)
  end

  # Stream a dictionary file, get all words of a certain lenght
  def load_dictionary(path, word_length) do
    File.stream!(path)
    |> Stream.map(&String.strip/1)
    |> Stream.map(&String.upcase/1)
    |> Stream.filter(fn(word) -> String.length(word) == word_length end)
    |> Enum.to_list
  end
end
