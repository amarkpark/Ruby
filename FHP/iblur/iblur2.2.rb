# iblur2 version 2 refactor 20151015
require 'rubygems'
require 'byebug'

class Array
	def deep_copy
		Marshal.load(Marshal.dump(self))
	end
end

class Image

	def initialize (initvalues)
		@image = initvalues
		@newimage = initvalues.deep_copy
	end

	def apply(x, y)
		above = (x-1)
		below = (x+1)
		left = (y-1)
		right = (y+1)
		if above >= 0
			@newimage[above][y] = 1 
		end
		if below < @newimage.length
			@newimage[below][y] = 1 
		end
		if left >= 0
			@newimage[x][left] = 1 
		end
		if right < @newimage[x].length
			@newimage[x][right] = 1 
		end
	end

	def blur
		@image.each_with_index do |row, x|
			row.each_with_index do |value, y|
				if value == 1
					self.apply(x, y)
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

# my tests below

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

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

image4.blur
image4.output_image
puts "After blur"
image4.output_newimage