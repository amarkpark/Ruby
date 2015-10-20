# CodeWars Remove Duplicates TEST

require 'minitest/autorun'
require_relative 'removedup'

class TestUnique < Minitest::Test

	def test_unique
		assert_equal unique([]), []
		assert_equal unique([5, 2, 1, 3]), [5, 2, 1, 3]
		assert_equal unique([1, 5, 2, 0, 2, -3, 1, 10]), [1, 5, 2, 0, -3, 10]
	end
end

#had to alter assertion names and syntax a bit