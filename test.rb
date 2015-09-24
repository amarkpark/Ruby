# test.rb
# dynamic content to test in console

class Image

	def initialize (x)
		@image = [x]
	end

	def output_image
		@image.each_index do |i| #ennumerating the row index
			@rows = @image[i]
			@rows.each do |row|
				puts row.join
			end
		end
	end

end	# class Image


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image

