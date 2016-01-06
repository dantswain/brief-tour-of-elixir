defmodule MacroExamples.Macros do
  # define a function for each key in config that
  # returns the corresponding value
  defmacro defconfig(config) do
    config |> Enum.map(fn({k, v}) ->
      quote do
        def unquote(k)() do
          unquote(v)
        end
      end
    end)
  end
end

defmodule MacroExamples do
  import MacroExamples.Macros

  # defines MacroExamples.foo and MacroExamples.bar
  defconfig(foo: 1, bar: 2)
end
