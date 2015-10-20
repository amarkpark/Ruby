# 20151015 iblur2.2 work

# iblur2 version 2 refactor 20151015

class Image

	def initialize (inputvalues)
		@image = inputvalues
		# @newimage = [[8,8,8,8], [8,8,8,8], [8,8,8,8], [8,8,8,8]]
		@newimage = inputvalues
	end

	# def initialize(values)
	# 	@image = values.to_a
	# 	@newimage = values.to_a
	# end

	def apply(x,y)
		# @newimage[x][y]
		above = (x-1)
		below = (x+1)
		left = (y-1)
		right = (y+1)
		# puts "A: #{above}, B: #{below}, L: #{left} R:#{right}"
		if above >= 0
			@newimage[above][y] = 1 
			# puts "can change #{@newimage[above][y]} above"
		end
		if below < @newimage.length
			@newimage[below][y] = 1 
			# puts "can change #{@newimage[below][y]} below"
		end
		if left >= 0
			@newimage[x][left] = 1 
			# puts "can change #{@newimage[x][left]} left"
		end
		if right < row.length
			@newimage[x][right] = 1 
			# puts "can change #{@newimage[x][right]} right"
		end
	end

	def blur
		@image.each_with_index do |row, x|
		# @newimage = Array.new(@image.length) {Array.new(row.length, 0)}
			# puts row.join
			row.each_with_index do |value, y|
				# puts "Row #{x} Col #{y} Value #{value}"
				if value == 1
					self.apply(x, y)
					# # puts "I'm a ONE!"
					# @newimage[x][y] = 1
					# above = (x-1)
					# below = (x+1)
					# left = (y-1)
					# right = (y+1)
					# # puts "A: #{above}, B: #{below}, L: #{left} R:#{right}"
					# if above >= 0
					# 	@newimage[above][y] = 1 
					# 	# puts "can change #{@newimage[above][y]} above"
					# end
					# if below < @newimage.length
					# 	@newimage[below][y] = 1 
					# 	# puts "can change #{@newimage[below][y]} below"
					# end
					# if left >= 0
					# 	@newimage[x][left] = 1 
					# 	# puts "can change #{@newimage[x][left]} left"
					# end
					# if right < row.length
					# 	@newimage[x][right] = 1 
					# 	# puts "can change #{@newimage[x][right]} right"
					# end
					# # byebug
				end
			end
		end
	end

	def output_image
		@image.each do |row|
			puts row.join
		end
	end

	def output_newimage
		@newimage.each do |row|
			puts row.join
		end
	end

end


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
puts
image.output_newimage
puts
image.blur
image.output_image
puts "After blur"
image.output_newimage

puts "image2"
image2 = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],  
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image2.output_image
puts
image2.output_newimage
puts
image2.blur
image2.output_image
puts "After blur"
image2.output_newimage

puts "image3"
image3 = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],  
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image3.output_image
puts
image3.output_newimage
puts
image3.blur
image3.output_image
puts "After blur"
image3.output_newimage

puts "image4"
image4 = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],  
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0]
])
image4.output_image
puts
image4.output_newimage
puts
image4.blur
image4.output_image
puts "After blur"
image4.output_newimage