defmodule PipeOperator do
  def without_pipes(x) do
    out1 = Enum.map(x, &double/1)
    sum = Enum.sum(out1)
  end

  def with_pipes(x) do
    x
    |> Enum.map(&double/1)
    |> Enum.sum
  end

  def equivalent_with_pipes(x) do
    x |> Enum.map(&double/1) |> Enum.sum
  end

  defp double(x) do
    2 * x
  end
end
