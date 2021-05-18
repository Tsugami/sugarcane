defmodule Sugarcane.Command do
 defstruct [:name, :aliases, :description]

 defmacro __using__(_) do
   quote do
      import Sugarcane.Command, only: [config: 2]

      @handles []
   end
 end


 defmacro config(_command_name, [do: block]) do
  quote do
    import Sugarcane.Command
    unquote(block)
  end
 end

 defmacro command_name(name) when is_binary(name) do
  IO.puts name
 end

#  defmacro __before_compile__(_env) do
#   quote do
#     defmacro __using__(_opts) do
#       for handle <- @handles do
#         quote do
#           Sugarcane.Command.CommandHandler.add(__MODULE__)
#         end
#       end
#     end
#   end
# end
end
