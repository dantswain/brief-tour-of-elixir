defmodule Functions do
  # a closure
  def adder(addend) do
    fn(x) ->
      x + addend
    end
  end

  # taking a function as an argument
  def map_adder(mapper) do
    fn(x1, x2) ->
      mapper.(x1) + mapper.(x2)
    end
  end
end
