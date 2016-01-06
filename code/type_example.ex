defmodule TypeExample do
  @type t :: {boolean, non_neg_integer}

  def fail1 do
    bar(-1.0)
  end

  def fail2 do
    {1, true} = baz({true, -1})
  end

  @spec bar(integer) :: t
  def bar(x) when is_integer(x) do
    {x >= 0, abs(x)}
  end

  @spec baz(t) :: non_neg_integer
  def baz({_, x}) do
    x
  end
end
