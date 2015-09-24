# CodeWars Remove Duplicates TEST

require 'minitest/autorun'
require_relative 'removedup'

class TestUnique < Minitest::Test
Test.assert_equals(unique([]), [])
Test.assert_equals(unique([5, 2, 1, 3]), [5, 2, 1, 3])
Test.assert_equals(unique([1, 5, 2, 0, 2, -3, 1, 10]), [1, 5, 2, 0, -3, 10])