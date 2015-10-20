# 20150918 Image Blur 1
# refactored on 20151014

class Image

	def initialize (x)
		@image = x
	end

	def output_image
		@image.each do |row|
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