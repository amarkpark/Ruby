# 20151024 my linked list solution myll.rb

class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
	end
end

def reverse_list(list_node)
	n = 1
	name = "@revnode#{n}"
	instance_variable_set(name, LinkedListNode.new(list_node.value, nil))
	begin
		list_node = list_node.next_node
		revnext = instance_variable_get(name)
		n += 1
		name = "@revnode#{n}"
		instance_variable_set(name, LinkedListNode.new(list_node.value, revnext))
	end until list_node.next_node.nil?
	return instance_variable_get(name)
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

