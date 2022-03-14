defmodule Example do
  def add(a, b) do
    IO.puts a + b
  end

  def listen do
    receive do
      {:ok, "hello"} -> IO.puts "World"
        # code
    end

    listen()
  end

  @spec explode :: none
  def explode, do: exit(:kaboom)

  def run_processflag do
    Process.flag(:trap_exit, true)
    spawn_link(Example, :explode, [])

    receive do
      {:EXIT, _from_pid, reason} -> IO.puts("Exit reason: #{reason}")
    end
  end

  def run_processmonitor do
    {_pid, _ref} = spawn_monitor(Example, :explode, [])

    receive do
      {:DOWN, _ref, :process, _from_pid, reason} -> IO.puts "Exit reason: #{reason}"
    end

  end
end
