# YOUR CODE HERE
def plus_two(number)
  number + 2
end

def subtract_or_multiply_by_two(number)
  if number < 0
    number - 2
  elsif number >= 0
    number * 2
  end
end

def repeat_last_word(sentence)
  sentence_arr = sentence.split(' ')
  last_word = sentence_arr[-1]
  sentence_arr.push(last_word).join(' ')
end

def return_value_of_type(the_symbol)
  if the_symbol == ":string"
    the_symbol.to_s
  elsif the_symbol == :fixnum
    the_symbol.to_s.to_i
  else
    "input does not match any Ruby class"
  end
end

def add_five_and_ten(the_array)
  the_array.push(5)
  the_array.push(10)
end
