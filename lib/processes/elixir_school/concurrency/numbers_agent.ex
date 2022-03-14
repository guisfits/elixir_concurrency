defmodule Numbers do
  def init(numbers) do
    Agent.start_link(fn -> numbers end, name: __MODULE__)
  end

  def get() do
    Agent.get(__MODULE__, & &1)
  end

  def add(number) do
    Agent.update(__MODULE__, fn state -> state ++ [number] end)
  end
end
