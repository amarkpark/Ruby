# 20150923 TDD10 adder.rb
require 'minitest/autorun'

class Adder

	def initialize(num1, num2)
		@num1 = num1
		@num2 = num2
	end

	def add
		@num1 + @num2
	end

end
