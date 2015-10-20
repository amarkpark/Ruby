# 20151017 iblur3.rb (starting with iblur2.2 code)
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

	def pixeltransform(x,y,n)
		row = x
		col = y
		reps = n
		reps.times do
			redge = (@newimage[row].length - 1)
			bottom = (@newimage.length - 1)
			dif = (reps - n)
			above = (row - n)
			below = (row + n)
			left = (col - n)
			right = (col + n)
			if above >= 0
				rspread = (col + dif)
				lspread = (col - dif)
				@newimage[above][col] = 1 
				if dif != 0
					dif.times do
						if rspread <= redge
							@newimage[above][rspread] = 1
						end
						rspread -= 1
					end
					dif.times do
						if lspread >= 0
							@newimage[above][lspread] = 1
						end
						lspread += 1
					end
				end
			end
			if below <= bottom
				rspread = (col + dif)
				lspread = (col - dif)
				@newimage[below][col] = 1
				if dif != 0
					dif.times do
						if rspread <= redge
							@newimage[below][rspread] = 1
						end
						rspread -= 1
					end
					dif.times do
						if lspread >= 0
							@newimage[below][lspread] = 1
						end
						lspread += 1
					end
				end
			end
			if left >= 0
				@newimage[row][left] = 1 
			end
			if right <= redge
				@newimage[row][right] = 1 
			end
			n -= 1
		end
	end

	def blur(n=1)
		@image.each_with_index do |row, x|
			row.each_with_index do |value, y|
				if value == 1
					pixeltransform(x,y,n)
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

# My tests below:

puts "image3"
image3 = Image.new([
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],  
  [0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 1],
])
image3.output_image
puts "...blur3..."
image3.blur(4)
puts "original Image"
image3.output_image
puts "new image3:"
image3.output_newimage