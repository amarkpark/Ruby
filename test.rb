# test.rb
# dynamic content to test in console

# This 2D array contains three sub-arrays.
values = Array[[10,20,30],[40,50,60],[70,80,90]]

# Load an element.
puts "Third element in first row is: " << String(values[0][2])

# Change this element.
place = values[1][1]

# Display all elements.
values.each do |x|
    x.each do |y|
	puts y
    end
    puts "--"
end

# # This is an irregular 2D array (a jagged array).
# values = [[0, 0, 0], [0, 1, 0], [0, 0, 0]]
# # values = [["A", "B", "C"], ["D", "E", "F"], ["G", "H"]]

# # Loop over indexes.
# values.each_index do |i|

#     # Get subarray and loop over its indexes also.
#     subarray = values[i]
#     subarray.each_index do |x|
# 	# Display the cell.
# 	# puts String(i) << " " << String(x) << "... " << values[i][x]
# 	value = values[i][x]
# 	puts "row: #{i} col: #{x} element: #{value}"
#     end

# end

# @row = []
# values.each_with_index { |row, rowi|
# 	puts "Row number: #{rowi} Length: #{row.length}"
# 	@row = row
# 	puts @row
# }
# puts values
# puts "next index"
# values.each_index do |i|
# 	# @rows = values[i]
# 	# @rows.each_with_index { |col, coli|
# 	# "Column number: #{coli} Value: #{col}"
# 	# }
# 	puts values[i] << " index: #{i}"
# end



# row = 0
# values.length.times do
# 	# puts "Row: #{row}"
# 	current = [values[row]]
# 	col = 0
# 	current.length.times do
# 		puts "Row: #{row} Col: #{col}"
# 		col += 1
# 		# print current.is_a?(Array)
# 	end
# 	row += 1
# end

# col = 0
# current = [values[row]]
# puts current.join
# current.length.times do
# 	puts "Row: #{row} Col: #{col}"
# 	col += 1
# end