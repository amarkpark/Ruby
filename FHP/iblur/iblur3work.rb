#iblur3 20151012
# iblur2.rb

class Array
	def deep_copy
		Marshal.load(Marshal.dump(self))
	end
end

class Image
	attr_accessor :i, :x, :row, :col, :ones

	def initialize(values)
		@image = values
		@newimage = values.deep_copy
	end

	def findones
		@ones = []
		@image.each_index do |i|
		    subarray = @image[i]
		    subarray.each_index do |x|
				value = @image[i][x]
				if value == 1
					puts "row: #{i} col: #{x} element: #{value}"
					@ones.push({:row => i, :col => x})
				end
		    end
		end
	end

	def blur(n=1)
		@n = n
		self.findones
		@ones.each do |one|
			puts one.inspect
			puts one[:row]
			puts one[:col]
			row = one[:row]
			col = one[:col]
			n = @n
			@n.times do 
				above = (row - n)
				below = (row + n)
				left = (col - n)
				right = (col + n)
				puts "A: #{above} B: #{below} L: #{left} R: #{right}"
				if above >= 0
					@newimage[above][col] = 1 
				end
				if below <= (@newimage.length - n)
					@newimage[below][col] = 1 
				end
				if left >= 0
					@newimage[row][left] = 1 
				end
				if right <= (@newimage[row].length - n)
					@newimage[row][right] = 1 
				end
				n -= 1
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
image3.show_original
puts "...blur3...r"
image3.blur(3)
puts "new image3:"
image3.show_blur


# 20151017

# 20151017 iblur3.rb (starting with iblur2.2 code)
require 'rubygems'
require 'byebug'

class Image

	def initialize (initvalues)
		@image = initvalues
		@newimage = initvalues
	end

	def pixeltransform(x,y,n)
		row = x
		col = y
		reps = n
		reps.times do
			puts n
			above = (x-n)
			below = (x+n)
			left = (y-n)
			right = (y+n)
			puts "A: #{above} B: #{below} L: #{left} R: #{right}"
			# byebug
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
			n-=1
		end
	end

	def blur(n=1)
		@image.each_with_index do |row, x|
			row.each_with_index do |value, y|
				if value == 1
					# self.pixeltransform(x,y,n)
					# byebug
					puts "I'm a ONE! At position: #{x} #{y}"
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
image3.blur(1)
puts "original Image"
image3.output_image
puts "new image3:"
image3.output_newimage


# 20151019 work

# 20151017 iblur3.rb (starting with iblur2.2 code)
# require 'rubygems'
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
		# byebug
	end

	def pixeltransform(x,y,n)
		row = x
		col = y
		reps = n
		# byebug
		reps.times do
			redge = (@newimage[row].length - 1)
			bottom = (@newimage.length - 1)
			# puts n
			dif = (reps - n)
			above = (row - n)
			below = (row + n)
			left = (col - n)
			right = (col + n)
			# rspread = (col + dif)
			# lspread = (col - dif)
			# puts "A: #{above} B: #{below} L: #{left} R: #{right} Dif: #{dif}"
			# byebug
			if above >= 0
				rspread = (col + dif)
				lspread = (col - dif)
				@newimage[above][col] = 1 
				if dif != 0
					if rspread <= redge
						dif.times do
							@newimage[above][rspread] = 3
							rspread -= 1
						end
					end
					if lspread >= 0
						dif.times do
							@newimage[above][lspread] = 3
							lspread += 1
						end
					end
				end
			end
			if below <= bottom
				rspread = (col + dif)
				lspread = (col - dif)
				@newimage[below][col] = 1
				if dif != 0
					if rspread <= redge
						dif.times do
							@newimage[below][rspread] = 3
							rspread -= 1
						end
					end
					if lspread >= 0
						dif.times do
							@newimage[below][lspread] = 3
							lspread += 1
						end
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
			# byebug
		end
	end

	def blur(n=1)
		@image.each_with_index do |row, x|
			row.each_with_index do |value, y|
				if value == 1
					pixeltransform(x,y,n)
					# byebug
					# puts "I'm a ONE! At position: #{x} #{y}"
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
image3.blur(3)
puts "original Image"
image3.output_image
puts "new image3:"
image3.output_newimage