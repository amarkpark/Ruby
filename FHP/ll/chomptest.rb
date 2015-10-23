# 20151022fml chomptest.rb
require 'byebug'

letters = String.new("a,b,c,d")

str = "This is a string."

p letters.is_a?(String)
p str.is_a?(String)

puts letters.chomp
puts str.chomp(" ")

puts letters.chomp(',')
puts str.chomp('a')

# example straight from ruby docs

p "hello".chomp("llo") 

# in the style of the functional example above

p "a,b,c,d".chomp(",")
p "alphabet".chomp("bet")

abcs = "alphabet"
tail = "bet"
p abcs.chomp(tail)

stack = "node1node2node3"
last = "node3"
p stack
stack.chomp!(last)
p stack