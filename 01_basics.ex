defmodule Basics do
  def print_name do
    name = IO.gets("What is your name? ") |> String.trim
    IO.puts "Hello #{name}"
  end

  def do_things do
    IO.puts "===== 01_BASICS ===================="
    data_type_things()
    string_things()
    more_string_things()
    pipe_things()
    math_things()
    comparison_things()
    logical_things()
    conditional_things()
  end

  def data_type_things do
    IO.puts "===== data_type_things ===================="
    my_int = 123
    IO.puts "Integer #{is_integer(my_int)}"

    my_float = 123.123
    IO.puts "Float #{is_float(my_float)}"

    my_atom = :Foo
    IO.puts "Atom #{is_atom(my_atom)}"

    one_to_10 = 1..10
    IO.puts "Count of range #{Enum.count(one_to_10)}"
  end

  def string_things do
    IO.puts "===== string_things ===================="
    my_str = "My Sentence"
    IO.puts "Length : #{String.length(my_str)}"

    longer_str = my_str <> " " <> "is longer"
    IO.puts longer_str
    IO.puts "my_str equal? longer_str : #{my_str == longer_str}"
    IO.puts "My ? #{String.contains?(my_str, "My")}"
    IO.puts "Index 4 : #{String.at(my_str, 4)}"
    IO.puts "Substring : #{String.slice(my_str, 3, 8)}"
  end

  def more_string_things do
    IO.puts "===== more_string_things ===================="
    longer_str = "Why hello there"
    IO.inspect String.split(longer_str, " ")

    IO.puts String.reverse(longer_str)
    IO.puts String.upcase(longer_str)
    IO.puts String.downcase(longer_str)
    IO.puts String.capitalize(longer_str)
  end

  def pipe_things do
    IO.puts "===== pipe_things ===================="
    4 * 10 |> IO.puts
  end

  def math_things do
    IO.puts "===== math_things ===================="
    IO.puts "5 + 4 == #{5+4}"
    IO.puts "5 - 4 == #{5-4}"
    IO.puts "5 * 4 == #{5*4}"
    IO.puts "5 / 4 == #{5/4}"

    # returns integer
    IO.puts "5 div 4 == #{div(5,4)}"
    # modulo
    IO.puts "5 rem 4 == #{rem(5,4)}"
  end

  def comparison_things do
    IO.puts "===== comparison_things ===================="
    IO.puts "4 == 4.0 : #{4 == 4.0}"
    IO.puts "4 === 4.0 : #{4 === 4.0}"
    IO.puts "4 != 4.0 : #{4 != 4.0}"
    IO.puts "4 !== 4.0 : #{4 !== 4.0}"

    IO.puts "4 > 5 : #{4 > 5}"
    IO.puts "4 >= 5 : #{4 >= 5}"
    IO.puts "4 < 5 : #{4 < 5}"
    IO.puts "4 <= 5 : #{4 <= 5}"
  end

  def logical_things do
    IO.puts "===== comparison_things ===================="

    age = 16

    IO.puts "Vote and Drive : #{(age >= 18 and age >= 16)}"
    IO.puts "Vote or Drive : #{(age >= 18 or age >= 16)}"
    IO.puts "Not true : #{not true}"
    IO.puts "Not not true : #{not not true}"
  end

  def conditional_things do
    age = 16

    IO.puts "If/else statements"
    if age >= 18 do
      IO.puts "Can vote"
    else
      IO.puts "Can't vote"
    end

    unless age == 18 do
      IO.puts "Not 18"
    end

    IO.puts "Cond statements"
    cond do
      # works like elseif
      age >= 18 -> IO.puts "You can vote"
      age >= 16 -> IO.puts "You can drive"
      age >= 14 -> IO.puts "You can wait"
      true -> IO.puts "Default"
    end

    IO.puts "Case statements"
    case 2 do
      1 -> IO.puts "Entered 1"
      2 -> IO.puts "Entered 2"
      _ -> IO.puts "Default"
    end

    IO.puts "Ternary : #{if age > 18, do: "Can vote", else: "Can't vote"}"
  end
end
