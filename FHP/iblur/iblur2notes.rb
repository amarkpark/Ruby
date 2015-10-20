# iblur2 notes

				case makeone
					when @image[row-1][col-1] === 1
						@newimage[row].at(col) = 1
					when @image[row-1][col] === 1
						@newimage[row][col] = 1
					when @image[row-1][col+1] === 1
						@newimage[row][col] = 1
					when @image[row][col-1] === 1
						@newimage[row][col] = 1
					when @image[row][col] === 1
						@newimage[row][col] = 1
					when @image[row][col+1] ===1
						@newimage[row][col] = 1
					when @image[row+1][col-1] === 1
						@newimage[row][col] = 1
					when @image[row+1][col] === 1
						@newimage[row][col] = 1
					when @image[row+1][col+1] ===1
						@newimage[row][col] = 1
					else
						@newimage[row][col] = 0
				end

				# case makeone
				# 	when @image[row-1][col-1] === 1
				# 		makeone = 1
				# 	when @image[row-1][col] === 1
				# 		makeone = 1
				# 	when @image[row-1][col+1] === 1
				# 		makeone = 1
				# 	when @image[row][col-1] === 1
				# 		makeone = 1
				# 	when @image[row][col] === 1
				# 		makeone = 1
				# 	when @image[row][col+1] ===1
				# 		makeone = 1
				# 	when @image[row+1][col-1] === 1
				# 		makeone = 1
				# 	when @image[row+1][col] === 1
				# 		makeone = 1
				# 	when @image[row+1][col+1] ===1
				# 		makeone = 1
				# 	else
				# 		makeone = 0
				# end

iblur2.rb:14:in `block (2 levels) in blur': undefined local variable or method `makeone' for #<Image:0xb8cbb6d8> (NameError)
	from iblur2.rb:13:in `each_index'
	from iblur2.rb:13:in `block in blur'
	from iblur2.rb:11:in `each_index'
	from iblur2.rb:11:in `blur'
	from iblur2.rb:56:in `<main>'

				# case 
				# 	when @image[row-1][col-1] == 1
				# 		@newimage[row].at(col) << 1
				# 	when @image[row-1][col] == 1
				# 		@newimage[row][col] << 1
				# 	when @image[row-1][col+1] == 1
				# 		@newimage[row][col] << 1
				# 	when @image[row][col-1] == 1
				# 		@newimage[row][col] << 1
				# 	when @image[row][col] == 1
				# 		@newimage[row][col] << 1
				# 	when @image[row][col+1] ==1
				# 		@newimage[row][col] << 1
				# 	when @image[row+1][col-1] == 1
				# 		@newimage[row][col] << 1
				# 	when @image[row+1][col] == 1
				# 		@newimage[row][col] << 1
				# 	when @image[row+1][col+1] ==1
				# 		@newimage[row][col] << 1
				# 	else
				# 		@newimage[row][col] << 0
				# end

returns:
iblur2.rb:27:in `block (2 levels) in blur': undefined method `[]' for nil:NilClass (NoMethodError)
	from iblur2.rb:13:in `each_index'
	from iblur2.rb:13:in `block in blur'
	from iblur2.rb:11:in `each_index'
	from iblur2.rb:11:in `blur'
	from iblur2.rb:56:in `<main>'


	def blur
		@image.each_index do |row|
			@rows = @image[row]
			@rows.each_index do |col|
				if row >= 1 && row < @image.length
					above = @image[row - 1].at(col)
					below = @image[row + 1].at(col)
				end
				if col >= 1 && col < @rows.length
					left = @image[row].at(col - 1)
					right = @image[row].at(col + 1)
				end
				# if above == 1 || below == 1 || left == 1 || right == 1
				# 	@newimage[row].at(col) = 1
				# end
				puts "A: #{above}, B: #{below}, L: #{left} R:#{right}"
			end
		end
	end

A: , B: , L:  R:
A: , B: , L: [0, 0, 0, 0] R:[0, 0, 0, 1]
A: , B: , L: [0, 1, 0, 0] R:[0, 0, 0, 0]
A: , B: , L: [0, 0, 0, 1] R:


	def blur
		@image.each_index do |row|
			@rows = @image[row]
			rowabove = @image[row][row - 1]
			rowbelow = @image[row][row + 1]
			@rows.each_index do |col|
				puts "row: #{row}, column: #{col}"
				puts "A: #{rowabove[col]}, B:#{rowbelow[col]}"
			end
		end
	end

[Web Dev]:  /vagrant/src/ruby/fhp/iblur2 $ ruby iblur2.rb
row: 0, column: 0
A: 0, B:0
row: 0, column: 1
A: 0, B:1
row: 0, column: 2
A: 0, B:0
row: 0, column: 3
A: 0, B:0


	def blur
		@image.each_with_index { |row, rindex|
			rowabove = @image[rindex - 1]
			rowbelow = @image[rindex + 1]
			row.each_index do |col|
				puts "row: #{rindex}, column: #{col}"
				puts "A: #{rowabove[col]}, B:#{rowbelow[col]}"
			end
		}
	end

[Web Dev]:  /vagrant/src/ruby/fhp/iblur2 $ ruby iblur2.rb
row: 0, column: 0
iblur2.rb:16:in `block (2 levels) in blur': undefined method `[]' for nil:NilClass (NoMethodError)
	from iblur2.rb:14:in `each_index'
	from iblur2.rb:14:in `block in blur'
	from iblur2.rb:11:in `each'
	from iblur2.rb:11:in `each_with_index'
	from iblur2.rb:11:in `blur'
	from iblur2.rb:37:in `<main>'


# 20151012 restartishness

# iblur2.rb

class Image

	def initialize(values)
		@image = values.to_a
		# @newimage = [values]
	end

	# def blur
	# 	@image.each_with_index do |row, row_index|
	# 		rowabove = @image[row_index - 1]
	# 		rowbelow = row[row_index + 1]
	# 		@rows.each_with_index do |cvalue, col|
	# 			puts "row: #{row}, column: #{col}, val: #{rvalue[col]}"
	# 			puts "A: #{rowabove[col]}, B:#{rowbelow[col]}"
	# 		end
	# 	end
	# end

	def inspect
		@image.each do |row|
			row.include?(1)

	end

	def blur
		@image.each_with_index do |row, rowi|
			@rows = @image[rowi]
			rowabove = @image[rowi - 1]
			rowbelow = @image[rowi + 1]
			@rows.each do |col|
				puts "row: #{rowi}, column: #{col}"
				puts "A: #{rowabove[col]}, B:#{rowbelow[col]}"
			end
		end
	end

	# def blur
	# 	@image.each_with_index { |rvals, rindex|
	# 		@row = [rvals]
	# 		@row.each_with_index { |cval, cindex|
	# 			puts "Row: #{rindex}, Col: #{cindex}, Value: #{cval}"
	# 		}

	# 	}
	# end

	# def output
	# 	@newimage.each_index do |x| #ennumerating the row index
	# 		@newrows = @newimage[x]
	# 		@newrows.each do |y|
	# 			puts y.join
	# 		end
	# 	end
	# end

	def output_image
		@image.each_index do |i| #ennumerating the row index
			@rows = @image[i]
			@rows.each do |row|
				puts row.join << " Row: #{i}"
			end
		end
	end

	def findindex
		# Loop over indexes.
		@image.each_index do |i|
		    # Get subarray and loop over its indexes also.
		    subarray = @image[i]
		    subarray.each_index do |x|
				# Display the cell.
				# puts String(i) << " " << String(x) << "... " << values[i][x]
				value = @image[i][x]
				puts "row: #{i} col: #{x} element: #{value}"
		    end
		end
	end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
# image.blur
# image.output_image
# image = Image.new([[1], [1], [1], [1]])
image.findindex

# 20151012 stuff from 20151011 above


items = Array.new
items.push({:a => "b", :c => "d"})

20151015
	def blur
		@image.each_with_index do |rows, x|
			# puts row.join
			rows.each_with_index do |value, y|
				puts "Row #{x} Col #{y} Value #{value}"
				if value == 1
					puts "I'm a ONE!"
					above = (x-1)
					below = (x+1)
					left = (y-1)
					right = (y+1)
					puts "A: #{above}, B: #{below}, L: #{left} R:#{right}"
					if value == 1 && above >= 0
						# @newimage[above][y] = 1 
						puts "can change above"
					end
					if value == 1 && below < @newimage.length
						# @newimage[below][y] = 1 
						puts "can change below"
					end
					if value == 1 && left >= 0
						# @newimage[x][left] = 1 
						puts "can change left"
					end
					if value == 1 && right < @newimage[x].length
						# @newimage[x][right] = 1 
						puts "can change right"
					end
				end
			end
		end
	end
