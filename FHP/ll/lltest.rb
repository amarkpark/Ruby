# lltest.rb 20151020
require 'byebug'

class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
		# why were these initialized as instance variables if they are accessor-ed
	end

	# def print_values(list_node)
	# 	print "#{list_node.value} --> "
	# 	if list_node.next_node.nil?
	# 		print "nil\n"	# "\n" means next line in regex
	# 		return
	# 	else
	# 		print_values(list_node.next_node)
	# 	end
	# end

	def findfirst(list_node)
		until list_node.next_node.nil?
			list_node = list_node.next_node
		end 
			# push value onto stack
		@first = list_node.value
		byebug
	end

	def revlist(list_node)
		lastvalue = list_node.value
		# initialize a new Stack object
		@revstack = Stack.new
		# pop items off the list and push them into stack
		begin
			findfirst(list_node)
			@revstack.push(@first)
		end until lastvalue == @first
		# pop items off stack into reverse list
		nodename
		rnode@incriment = LinkedListNode.new(@revstack.pop, lambda {})
	end

end

# # Write a lambda to create sequential variable names?
# class Varname
# 	attr_accessor :constant, :delta, :newvar

# 	def initialize(constant, delta)
# 		newvar = "#{constant}#{delta}"
# 		newvar
# 	end

# end

# puts Varname.new("name", 1)

# 20151022 Linked List #1 llist1.rb


# class Stack
#     attr_reader :data, :topval
    
#     def initialize
#         @data = nil
#     end

#     def push(value)
#     	value = value.to_s(16)
#     	@data = "#{value.length.to_s(16)}#{value}#{@data}"
#     end

#     def pop
#         length = @data.byteslice(0).to_i(16)
#         topval = @data.byteslice(1, length).to_i(16)
#         remainder = (@data.length - length)
#         @data = @data.byteslice((length+1), remainder)
#         topval
#     end

# end

def print_values(list_node)
	print "#{list_node.value} --> "
	if list_node.next_node.nil?
		print "nil\n"	# "\n" means next line in regex
		return
	else
		print_values(list_node.next_node)
	end
end


def reverse_list(list_node)
	test_node = list_node
	revstack = Stack.new
	previous_node = nil
	# test if next_node is nil
	# set previous_node value to list_node 
	# set list_node to its own next_node
	# if nil push value onto Stack
	while list_node != revstack.pop
		if previous_node == list_node
			revstack.push(test_node)
			revstack.push(previous_node)
			return
		elsif test_node.next_node.nil?
			revstack.push(test_node)
			test_node = previous_node
		else
			previous_node = test_node
			test_node = test_node.next_node
		end
	end
	
	until revstack.pop.nil?
		revstack.pop.

	#this stack stuff is CRAP
end


# def reverse_list(list)
#     # ADD CODE HERE

#     while list
#         # ADD CODE HERE
#         list = list.next_node
#     end

#     # ADD CODE HERE
# end


# end

class Stack
	attr_reader :data

	def initialize
		@data = nil
	end

	def push(value)
		@topval = value
		@data = "#{@data}#{value}"
	end

	def pop
		if @data.nil? || @topval.nil?
			return
		else
			@data.chomp!(@topval)
			@topval
		end
	end
end

# def reverse_list(list_node)
# 	revstack = Stack.new
# 	revstack.push(list_node.value)
# 	revstack
# end



node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
 
print_values(node3)

puts "-------"

revlist = reverse_list(node3)
byebug
print_values(revlist)

# My Tests Below

# stack = Stack.new
# stack.push(333)
# stack.push(22)
# stack.push(1)
# stack.push(13)
# stack.push(3462)
# puts stack.inspect
# puts stack.pop
# puts stack.pop
# puts stack.pop
# puts stack.pop
# puts stack.pop
# puts stack.data
