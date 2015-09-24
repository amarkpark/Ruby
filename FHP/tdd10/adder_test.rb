# 20150923 TDD10 adder_test.rb

require 'minitest/autorun'
require_relative 'adder'

class TestAdder < Minitest::Test

	def test_adder
		adder = Adder.new(10,17)
		assert_equal 27, adder.add
	end

end	