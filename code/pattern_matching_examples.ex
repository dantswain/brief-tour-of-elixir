defmodule PatternMatchingExamples do
  def foo(x) when is_integer(x) do
    IO.puts("#{x} is an integer!")
  end

  def bar(:plus, x, y) do
    x + y
  end
  def bar(:minus, x, y) do
    x - y
  end
  def bar(:times, x, y) do
    x * y
  end
  def bar(:divide, x, y) do
    x / y
  end

  def sum_tuple({x, y, z}) do
    x + y + z
  end
end
