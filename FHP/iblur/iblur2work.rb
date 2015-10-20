#iblur2work.rb
# iblur2.rb

class Image
	attr_accessor :i, :x, :row, :col, :ones

	def initialize(values)
		@image = values.to_a
		@newimage = values.to_a
	end

	def findones
		@ones = []
		# Loop over indexes.
		@image.each_index do |i|
		    # Get subarray and loop over its indexes also.
		    subarray = @image[i]
		    subarray.each_index do |x|
				# Display the cell.
				# puts String(i) << " " << String(x) << "... " << values[i][x]
				value = @image[i][x]
				if value == 1
					# puts "row: #{i} col: #{x} element: #{value}"
					# self.blur(i, x)
					@ones.push({:row => i, :col => x})
				end
				# puts "row: #{i} col: #{x} element: #{value}"
		    end
		end
		# puts @ones.inspect
	end

	# def newindex
	# 	# Loop over indexes.
	# 	@newimage.each_index do |i|
	# 	    # Get subarray and loop over its indexes also.
	# 	    row = @newimage[i]
	# 	    row.each_index do |x|
	# 			# Display the cell.
	# 			# puts String(i) << " " << String(x) << "... " << values[i][x]
	# 			value = @image[i][x]
	# 			if value == 1
	# 				puts "row: #{i} col: #{x} element: #{value}"
	# 				self.Image.blur(i, x)
	# 			end
	# 			# puts "row: #{i} col: #{x} element: #{value}"
	# 	    end
	# 	end
	# end

	def blur
		self.findones
		@ones.each do |one|
			# puts one.inspect
			# puts one[:row]
			# puts one[:col]
			row = one[:row]
			col = one[:col]
			above = (row - 1)
			below = (row + 1)
			left = (col - 1)
			right = (col + 1)
			if above >= 0
				@newimage[above][col] = 1 #above
			end
			if below < @newimage.length
				@newimage[below][col] = 1 #below
			end
			if left >= 0
				@newimage[row][left] = 1 #left
			end
			if right < @newimage[row].length
				@newimage[row][right] = 1 #right
			end
		end

	end

	# def blur
	# 	@image.each_with_index do |row, rowi|
	# 		@rows = @image[rowi]
	# 		rowabove = @image[rowi - 1]
	# 		rowbelow = @image[rowi + 1]
	# 		@rows.each do |col|
	# 			puts "row: #{rowi}, column: #{col}"
	# 			puts "A: #{rowabove[col]}, B:#{rowbelow[col]}"
	# 		end
	# 	end
	# end

	# def blur
	# 	@image.each_with_index { |rvals, rindex|
	# 		@row = [rvals]
	# 		@row.each_with_index { |cval, cindex|
	# 			puts "Row: #{rindex}, Col: #{cindex}, Value: #{cval}"
	# 		}

	# 	}
	# end

	def output_blur
		@newimage.each do |nirow| 
			puts nirow.join
		end
	end

	def output_original
		@image.each do |irow| #ennumerating the row index
			puts irow.join
		end
	end

	# def findindex

	# end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
# test = Image.new([[0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0]])
# image.blur
# image.output_image
# image = Image.new([[1], [1], [1], [1]])
# image.findones
image.output_original
puts "now to blur"
image.blur
puts "new image:"
image.output_blur
