# 20151024 myllnotes.rb

# 20151024 my linked list solution myll.rb
require 'byebug'


class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
	end
end

# class Stack
# 	attr_reader :data

# 	def initialize
# 		@data = nil
# 	end

# 	def push(value)
# 		@data = LinkedListNode.new(value, @data)
# 	end

# 	def pop
# 		data = @data
# 		@data = @data.next_node
# 		return data
# 	end
# end


# Metacode example from Office Hours:
# 10.times do |n|
#   var = :"@hello#{n}"
#   instance_variable_set(var, "good day")
# end

def reverse_list(list_node)
	n = 1
	name = "@revnode#{n}"
	instance_variable_set(name, LinkedListNode.new(list_node.value, nil))
	begin
		list_node = list_node.next_node
		revnext = instance_variable_get(name)
		n += 1
		name = "@revnode#{n}"
		# byebug
		# list_node = list_node.next_node
		instance_variable_set(name, LinkedListNode.new(list_node.value, revnext))
		# byebug	
	end until list_node.next_node.nil?
	return instance_variable_get(name)
end

# def reverse_list(list_node)
# 	revstack = Stack.new
# 	begin
# 		current_value = list_node.value
# 		revstack.push(current_value)
# 		list_node = list_node.next_node
# 	end until list_node.nil?
# 	return revstack.pop
	
# end

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

