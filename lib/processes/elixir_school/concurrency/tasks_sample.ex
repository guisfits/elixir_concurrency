defmodule TasksSample do
  def double(x) do
    IO.puts("Processing...")
    :timer.sleep(2000)
    x * 2
  end

  def create_task, do: Task.async(TasksSample, :double, [2000])

  def get_task_value do
    create_task()
    |> Task.await()
  end
end
