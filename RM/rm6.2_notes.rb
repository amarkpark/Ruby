# RubyMonk 6.2 Calling a Method last exercise notes:


def add(*numbers)
  numbers.inject(0) { |sum, number| sum + number }
end

def subtract(*numbers)
  total = numbers.slice!(0)
  numbers.each do |n|
    total = total - n
  end
  return total
end

def calculate(*numbers, option)
  if option.is_a?(Integer)
    numbers << option
    add(*numbers)
  elsif option[:subtract]
    subtract(*numbers)
  else
    add(*numbers)
  end
end

# below is the 'elegant' RubyMonk solution

# def add(*numbers)
#   numbers.inject(0) { |sum, number| sum + number }  
# end

# def subtract(*numbers)
#   current_result = numbers.shift
#   numbers.inject(current_result) { |current_result, number| current_result - number }  
# end

# def calculate(*arguments)
#   # if the last argument is a Hash, extract it 
#   # otherwise create an empty Hash
#   options = arguments[-1].is_a?(Hash) ? arguments.pop : {}
#   options[:add] = true if options.empty?
#   return add(*arguments) if options[:add]
#   return subtract(*arguments) if options[:subtract]
# end
