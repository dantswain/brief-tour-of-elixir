defmodule SampleElixir do
  def factorial(n) do
    factorial(n, 1)
  end

  defp factorial(1, acc) do
    acc
  end
  defp factorial(n, acc) do
    factorial(n - 1, n * acc)
  end
end
