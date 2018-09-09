require IEx;

defmodule Root do
  Code.require_file("./01_basics.ex", "./derek_banas")
  Code.require_file("./02_collections.ex", "./derek_banas")

  def do_things do
    # IEx.pry
    Basics.do_things
    Collections.do_things
  end
end

Root.do_things
