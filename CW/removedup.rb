# CodeWars Remove Duplicates

# Define the unique method that removes duplicates
# def unique(integers)

# 	@arrayb4 = integers.to_a
# 	@arrayafter = []

# 	@arrayb4.each_index do |i| #ennumerating values in arrayb4
# 		x = @arrayb4[i]
# 		if @arrayafter.include?(x) == false
# 			@arrayafter << x
# 		end
# 	end

# 	return @arrayafter

# end

def unique(integers)

	@arrayb4 = integers.to_a
	@arrayafter = []

	@arrayb4.map { |x|
		if @arrayafter.include?(x) == false
			@arrayafter << x
		end
	}

	return @arrayafter

end

puts unique([1, 5, 2, 0, 2, -3, 1, 10]).inspect
puts unique([]).inspect
puts unique([5, 2, 1, 3]).inspect