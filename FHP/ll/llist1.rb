# 20151022 Linked List #1 llist1.rb
require 'byebug'


class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
	end
end

class Stack
	attr_reader :data

	def initialize
		@data = nil
	end

	def push(value)
		@data = LinkedListNode.new(value, @data)
	end

	def pop
		data = @data
		@data = @data.next_node
		return data
	end
end

def reverse_list(list_node)
	revstack = Stack.new
	begin
		current_value = list_node.value
		revstack.push(current_value)
		list_node = list_node.next_node
	end until list_node.nil?
	return revstack.pop
	
end

def print_values(list_node)
	print "#{list_node.value} --> "
	if list_node.next_node.nil?
		print "nil\n"	
		return
	else
		print_values(list_node.next_node)
	end
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(84, node3)

print_values(node4)

puts "-------"

revlist = reverse_list(node4)

print_values(revlist)

