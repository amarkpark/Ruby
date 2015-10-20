# Arithmatic Sequence! Code War

# You're going to write a function that's going to return the value 
# in the nth index of an arithmetic sequence. (That is, adding a constant 
# to move to the next element in the "set"). f(n) = f(n-1) + c

# The function's name is nthterm, it takes three inputs first,n,c where:

# first is the first value in the 0 INDEX.
# n is the index of the value we want.
# c is the constant added between the terms.
# Remember that first is in the index 0 .. just saying ...


# def nthterm(first, n, c)
# 	seq = [first]
# 	x = first
# 	n.times do
# 		x = x + c
# 		seq << x
# 	end
# 	seq[n]
# end

# puts nthterm(-50, 10, 20)

# the answer I submitted
def nthterm(first, n, c)
	x = first
	n.times do
		x = x + c
	end
	return x
end

# # someone else's answer who is better at math:
# def nthterm(first, n, c)
#   first + n * c
# end

puts nthterm(1, 2, 3)
puts nthterm(2, 2, 2)
puts nthterm(-50, 10, 20)



# puts seq[n]

# fill(start [, length] ) { |index| block } → ary

# def nthterm(first, n, c)
# 	sequence = []
# 	sequence.fill(first, n) {|i| sequence(i-1)}