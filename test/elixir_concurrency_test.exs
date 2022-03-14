defmodule ElixirConcurrencyTest do
  use ExUnit.Case
  doctest ElixirConcurrency

  test "greets the world" do
    assert ElixirConcurrency.hello() == :world
  end
end
