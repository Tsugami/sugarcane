defmodule Sugarcane.Command.AliasesRegistry do
  @moduledoc false

  def init do
    Registry.start_link(keys: :unique, name: __MODULE__)
  end

  def via do
    {:via, Registry, {__MODULE__, :aliases_registry}}
  end

  def register(command_name, [head | tail]) when is_binary(command_name) do
    :ok = do_register(command_name, head)
    register(command_name, tail)
  end

  def register(command_name, _) when is_binary(command_name) do
    :ok = do_register(command_name, command_name)
    :ok
  end

  defp do_register(command_name, command_alias) when is_binary(command_name) and is_binary(command_alias) do
    case Registry.register(__MODULE__, command_alias, command_name) do
      {:ok, _} -> :ok
      {:error, reason, _} -> {:error, reason}
    end
  end

 def get_command_name(str) when is_binary(str) do
  case Registry.lookup(__MODULE__, str) do
    [{_pid, command_name}] -> command_name
    _ -> nil
  end
 end
end
