-module(sample_erlang).

-export([factorial/1]).

factorial(N) ->
  factorial(N, 1).

factorial(1, Acc) ->
  Acc;
factorial(N, Acc) ->
  factorial(N - 1, N * Acc).
