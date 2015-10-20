# ruby notes

# methods
def add_numbers(n1, n2)
	n1 + n2
end

def subtract_numbers(n1, n2)
	n1 - n2
end

# lambdas that do the same thing
add_nums = lambda do |n1, n2|
	n1 + n2
end

# lambdas are BOTH methods AND variables
subtract_nums = lambda do |n1, n2|
	n1 - n2
end

# method that calls a lambda
def combine(lam, n1, n2)
	lam.call(n1, n2)
end

# methods
puts add_numbers(1, 2)
puts subtract_numbers(5, 1)
# lambdas
puts add_nums.call(2, 3)
puts subtract_nums.call(8, 2)
# method calling lambda as argument by variable name
puts combine(add_nums, 3, 4)
puts combine(subtract_nums, 9, 1)
# method calling lambda as argument without using variable name
# this lambda with out a name is an "anonymous function"
puts combine(lambda{|n1, n2| n1**n2}, 3, 2)