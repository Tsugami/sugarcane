defmodule Sugarcane.Command.CommandHandler do

  use GenServer

  def start_link  do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_) do
    {:ok, %{}}
  end

  # def add_or_update_command (%Command{name: name} = command, state) when is_binary(name) do
  #   case Map.get(state, String.to_atom(name)) do
  #     nil -> state
  #     old_command ->
  #       new_command = Map.merge(old_command, command)
  #       puts.
  #   end
  # end

  def add_command (data) do
    inspect data
  end


end
