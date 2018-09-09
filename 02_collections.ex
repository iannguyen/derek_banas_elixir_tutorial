defmodule Collections do
  def do_things do
    IO.puts "===== 02_COLLECTIONS ===================="
    tuple_things()
    list_things()
    enum_things()
    map_things()
    pattern_matching_things()
    anonymous_function_things()
    loop_things()
    more_enum_things()
    list_comprehension_things()
    exception_things()
    concurrency_things()
  end

  def tuple_things do
    # not used for enumerating over
    # seems like tuples would be used for structs
    IO.puts "===== tuple_things ===================="

    my_stats = {175, 6.25, :Ian}
    IO.puts "Tuple #{is_tuple(my_stats)}"

    my_stats2 = Tuple.append(my_stats, 42)
    IO.puts "Age #{elem(my_stats2, 3)}"
    IO.puts "Size : #{tuple_size(my_stats2)}"

    my_stats3 = Tuple.delete_at(my_stats2, 0)
    my_status4 = Tuple.insert_at(my_stats3, 0, 1974)
    many_zeroes = Tuple.duplicate(0, 5)
    {weight, height, name} = {175, 6.25, "Ian"}
    IO.puts "Weight : #{weight}"
  end

  def list_things do
    IO.puts "===== list_things ===================="
    list1 = [1,2,3]
    list2 = [4,5,6]
    list3 = list1 ++ list2
    list4 = list3 -- list1

    # #in is part of kernel
    IO.puts 6 in list4

    [head | tail] = list3
    IO.puts "Head : #{head}"

    # #write is like ruby #print
    IO.write "Tail : "
    IO.inspect tail

    # https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html
    # https://github.com/elixir-lang/elixir/wiki/FAQ#4-why-is-my-list-of-integers-printed-as-a-string
    IO.inspect [97,98]
    IO.inspect [97,98], charlists: :as_lists
    IO.inspect [97, 98, 0]

    "31:30"
  end

  def enum_things do
    IO.puts "===== enum_things ===================="

    nums = [1, 2, 3]
    Enum.each nums, fn num ->
      IO.puts num
    end

    words = ["random", "words", "in", "a", "list"]
    display_list(words)

    IO.puts display_list(List.delete(words, "random"))
    IO.puts display_list(List.delete_at(words, 1))
    IO.puts display_list(List.insert_at(words, 4, "yayyy"))

    IO.puts List.first(words)
    IO.puts List.last(words)

    # list of key value pairs, and how to enumerate over them
    my_stats = [name: "ian", height: 5.9]

    Enum.each my_stats, fn {key, val} ->
      IO.inspect key
      IO.inspect val
    end
  end

  defp display_list([word| words]) do
    IO.puts word
    display_list(words)
  end

  # you can apparently define a function with the same name
  # but a list that's empty vs a list that can split a head
  # and tail and it will know which to call
  # wonder what applications can be used for this?
  defp display_list([]), do: nil

  def map_things do
    IO.puts "===== map_things ===================="
    capitals = %{
      "Alabama" => "Montgomery",
      "Alaska" => "Juneau",
      "Arizona" => "Phoenix"
    }

    IO.puts "Capital of Alaska is : #{capitals["Alaska"]}"

    capitals_symbols = %{
      alabama: "Montgomery",
      alaska: "Juneau",
      arizona: "Phoenix"
    }

    IO.puts "Capital of Arizona is : #{capitals_symbols.arizona}"

    new_capitals = Dict.put_new(capitals, "Arkansas", "Little Rock")

    IO.inspect new_capitals
  end

  def pattern_matching_things do
    IO.puts "===== pattern_matching_things ===================="
    [length, width] = [20,30]
    IO.puts "Width : #{width}"

    [_, [_, a]] = [20, [30, 40]]
    IO.puts "Get Num : #{a}"
  end

  def anonymous_function_things do
    IO.puts "===== anonymous_function_things ===================="
    # anonymous functions need to invoked with a dot?
    # anonymous functions are also closures
    get_sum = fn (x, y) -> x + y end

    IO.puts "5 + 5 = #{get_sum.(5,5)}"

    # some weird syntactic sugar for the same thing above
    get_less = &(&1 - &2)

    IO.puts "7 - 6 = #{get_less.(7,6)}"

    # different anonymous function for different number of arguments
    add_sum = fn
      {x, y} -> IO.puts "#{x} + #{y} = #{x + y}"
      {x, y, z} -> IO.puts "#{x} + #{y} + #{z} = #{x + y + z}"
    end

    IO.puts "This is an anonymous function"
    IO.inspect add_sum

    add_sum.({1,2})
    add_sum.({1,2,3})

    IO.puts do_it()

    IO.puts put_string("foo")
  end

  # default values for functions
  defp do_it(x \\ 1, y \\1) do
    x + y
  end

  def recursion_things do
    IO.puts "Factorial of 3: #{factorial(3)}"
  end

  defp factorial(num) do
    if num <= 1 do
      1
    else
      result = num * factorial(num - 1)
      result
    end
  end

  defp put_string(outer_string) do
    IO.puts outer_string

    annonymous_put_string = fn(inner_string) ->
      IO.puts "#{outer_string} #{inner_string}"
    end

    annonymous_put_string.("bar")
  end

  def loop_things do
    IO.puts "===== loop_things ===================="
    "48:50"

    IO.puts "Sum : #{sum([1,2,3])}"

    loop(5, 1)
  end

  defp sum([]), do: 0
  defp sum([h | t]), do: h + sum(t)

  defp loop(0, _), do: nil
  defp loop(max, min) do
    if max < min do
      loop(0, min)
    else
      IO.puts "Num : #{max}"
      loop(max - 1, min)
    end
  end

  def more_enum_things do
    IO.puts "===== loop_things ===================="

    IO.puts "Even List : #{Enum.all?([1,2,3], fn(n) -> rem(n, 2) == 0 end)}"
    Enum.each([1,2,3], fn(n) -> IO.puts n end)

    dbl_list = Enum.map([1,2,3], fn(n) -> n * 2 end)
    IO.inspect dbl_list

    sum_vals = Enum.reduce([1,2,3], fn(n, sum) -> n + sum end)
    IO.puts "Sum : #{sum_vals}"

    IO.inspect Enum.uniq([1,2,2])
  end

  def list_comprehension_things do
    IO.puts "===== list_comprehension_things ===================="

    dbl_list = for n <- [1,2,3], do: n * 2
    IO.inspect dbl_list

    even_list = for n <- [1,2,3,4], rem(n, 2) == 0, do: n
    IO.inspect even_list
  end

  def exception_things do
    IO.puts "===== exception_things ===================="

    err = try do
      5 / 0

    rescue
      ArithmeticError -> "Can't divide by zero"
    end

    IO.puts err
  end

  def concurrency_things do
    IO.puts "===== exception_things ===================="

    # processes are working at the same time
    spawn(fn() -> loop(50, 1) end)
    spawn(fn() -> loop(100, 50) end)

    # sending messages
    send(self(), {:french, "Pusheen"})

    receive do
      {:german, name} -> IO.puts "Guten tag #{name}"
      {:french, name} -> IO.puts "Bonjour #{name}"
      {:english, name} -> IO.puts "Hello #{name}"
    end
  end
end
