# 20150925 CodeWars Color Ghost

class Ghost
	attr_accessor :color

	def initialize
		colors = ["white", "yellow", "purple", "red"]
		self.color = colors.sample
	end

	# def color
	# 	colors = ["white", "yellow", "purple", "red"]
	# 	print colors.sample
	# end

end

ghost = Ghost.new
puts ghost.color