# iblur2.rb

class Image
	attr_accessor :i, :x, :row, :col, :ones

	def initialize(values)
		@image = values.to_a
		@newimage = values.to_a
	end

	def findones
		@ones = []
		@image.each_index do |i|
		    subarray = @image[i]
		    subarray.each_index do |x|
				value = @image[i][x]
				if value == 1
					@ones.push({:row => i, :col => x})
				end
		    end
		end
	end

	def blur
		self.findones
		@ones.each do |one|
			row = one[:row]
			col = one[:col]
			above = (row - 1)
			below = (row + 1)
			left = (col - 1)
			right = (col + 1)
			if above >= 0
				@newimage[above][col] = 1 
			end
			if below < @newimage.length
				@newimage[below][col] = 1 
			end
			if left >= 0
				@newimage[row][left] = 1 
			end
			if right < @newimage[row].length
				@newimage[row][right] = 1 
			end
		end

	end

	def show_blur
		@newimage.each do |nirow| 
			puts nirow.join
		end
	end

	def show_original
		@image.each do |irow| 
			puts irow.join
		end
	end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.show_original
puts "now to blur"
image.blur
puts "new image:"
image.show_blur
puts "image2"
image2 = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],  
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image2.show_original
puts "...blur2...r"
image2.blur
puts "new image2:"
image2.show_blur
puts "image3"
image3 = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],  
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image3.show_original
puts "...blur3..."
image3.blur
puts "new image3:"
image3.show_blur
puts "image4"
image4 = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],  
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0]
])

image4.blur
image4.show_original
puts "...blur4..."
puts "new image4:"
image4.show_blur

