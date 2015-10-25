# llnotes.rb 20151020
require 'byebug'

class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
	end

	def print_values(list_node)
		print "#{list_node.value} --> "
		if list_node.next_node.nil?
			print "nil\n"	# \n is new line
			return
		else
			print_values(list_node.next_node)
		end
	end

# Do I do this with TWO stacks or a loop that steps
# to the front of the list until it finds "nil" and pushes
# that value onto a single stack over and over until it gets
# to the end?

	# def findfirst(list_node)
	# 	while list_node.next_node.nil? == false
	# 		list_node = list_node.next_node
	# 	end
	# 	if list_node.next_node.nil?
	# 		# push value onto stack
	# 		@first = list_node.value
	# 	end
	# end

	def findfirst(list_node)
		begin
			list_node = list_node.next_node
		end until list_node.next_node.nil?
			# push value onto stack
		@first = list_node.value
		byebug
	end

	def revlist(list_node)
		# initialize a new Stack object
		@revstack = Stack.new
		# pop items off the list and push them into stack
		@revstack.push(node1.value)
		@revstack.push
		# pop items off stack into reverse list
	end

end

class Stack
    attr_reader :data
    
    def initialize
        @data = nil
    end

    # Push a value onto the stack
    def push(value)
        # IMPLEMENT ME!
    end

    # Pop an item off the stack.  
    # Remove the last item that was pushed onto the
    # stack and return the value to the user
    def pop
        # I RETURN A VALUE
    end

end

def reverse_list(list)
    # ADD CODE HERE

    while list
        # ADD CODE HERE
        list = list.next_node
    end

    # ADD CODE HERE
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
 
node3.print_values(node3)
node2.print_values(node2)


# 20151022 below

# lltest.rb 20151020
require 'byebug'

# class LinkedListNode
# 	attr_accessor :value, :next_node

# 	def initialize(value, next_node=nil)
# 		@value = value
# 		@next_node = next_node
# 		# why were these initialized as instance variables if they are accessor-ed
# 	end

# 	def print_values(list_node)
# 		print "#{list_node.value} --> "
# 		if list_node.next_node.nil?
# 			print "nil\n"	# "\n" means next line in regex
# 			return
# 		else
# 			print_values(list_node.next_node)
# 		end
# 	end

# 	def findfirst(list_node)
# 		until list_node.next_node.nil?
# 			list_node = list_node.next_node
# 		end 
# 			# push value onto stack
# 		@first = list_node.value
# 		byebug
# 	end

# 	def revlist(list_node)
# 		lastvalue = list_node.value
# 		# initialize a new Stack object
# 		@revstack = Stack.new
# 		# pop items off the list and push them into stack
# 		begin
# 			findfirst(list_node)
# 			@revstack.push(@first)
# 		end until lastvalue == @first
# 		# pop items off stack into reverse list
# 		nodename
# 		rnode@incriment = LinkedListNode.new(@revstack.pop, lambda {})
# 	end

# 	def reverse_list(list_node)
# 		@
# 	end
# end

# # Write a lambda to create sequential variable names?
# class Varname
# 	attr_accessor :constant, :delta, :newvar

# 	def initialize(constant, delta)
# 		newvar = "#{constant}#{delta}"
# 		newvar
# 	end

# end

# puts Varname.new("name", 1)

class Stack
    attr_reader :data, :topval, :stack
    
    def initialize
        @data = nil
    end

    # Push a value onto the stack
    def push(value)
    	value = value.to_s(16)
    	# @last = value.length
        @data = "#{value.length.to_s(16)}#{value}#{@data}"
        # byebug
    end

    # Pop an item off the stack.  
    # Remove the last item that was pushed onto the
    # stack and return the value to the user
    def pop
        # I RETURN A VALUE
        # start = (data.length)
        length = @data.byteslice(0).to_i(16)
        topval = @data.byteslice(1, length).to_i(16)
        remainder = (@data.length - length)
        @data = @data.byteslice((length+1), remainder)
        # byebug
        puts topval
        
    end

end

# node1 = LinkedListNode.new(37)
# node2 = LinkedListNode.new(99, node1)
# node3 = LinkedListNode.new(12, node2)
 
# node3.print_values(node3)

# puts "-------"

# revlist = reverse_list(node3)

# print_values(revlist)

stack = Stack.new
stack.push(333)
stack.push(22)
stack.push(1)
stack.push(13)
stack.push(3462)
stack.inspect
stack.pop
stack.pop
stack.pop
stack.pop
stack.pop
# byebug
puts stack.data

# 20151024 stack notes
class GenericStack
	attr_reader :data

	def initialize
		@data = nil
	end

	def push(value)
		@topval = value
		@data = "#{@data}#{value}"
	end

	def pop
		@data.chomp!(@topval)
		@topval
	end
end

class NumberStack
    attr_reader :data, :topval
    
    def initialize
        @data = nil
    end

    def push(value)
    	value = value.to_s(16)
    	@data = "#{value.length.to_s(16)}#{value}#{@data}"
    end

    def pop
        length = @data.byteslice(0).to_i(16)
        topval = @data.byteslice(1, length).to_i(16)
        remainder = (@data.length - length)
        @data = @data.byteslice((length+1), remainder)
        topval
    end
end

# llisst1.rb 20151024

# 20151022 Linked List #1 llist1.rb
require 'byebug'


class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
		# why were these initialized as instance variables if they are accessor-ed
	end
end

class Stack
	attr_reader :data

	def initialize
		@data = nil
	end

	def push(value)
		@data = LinkedListNode.new(value, @data)
		# value.next_node = @data
		# @data = value
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
		# revstack.push(list_node)
		# byebug
	end until list_node.nil?
	# byebug
	return revstack.pop
	
end

def print_values(list_node)
	print "#{list_node.value} --> "
	if list_node.next_node.nil?
		print "nil\n"	# "\n" means next line in regex
		return
	else
		print_values(list_node.next_node)
	end
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)

print_values(revlist)

# class Stack
# 	attr_reader :data

# 	def initialize
# 		@data = nil
# 	end

# 	def push(value)
# 		@topval = value
# 		@data = "#{@data}#{value}"
# 	end

# 	def pop
# 		@data.chomp!(@topval)
# 		@topval
# 	end
# end

# class GenericStack
# 	attr_reader :data

# 	def initialize
# 		@data = nil
# 	end

# 	def push(value)
# 		@topval = value
# 		@data = "#{@data}#{value}"
# 	end

# 	def pop
# 		@data.chomp!(@topval)
# 		@topval
# 	end
# end

# class NumberStack
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

# # node1 = LinkedListNode.new(37)
# # node2 = LinkedListNode.new(99, node1)
# # node3 = LinkedListNode.new(12, node2)
 
# # node3.print_values(node3)

# # puts "-------"

# # revlist = reverse_list(node3)

# # print_values(revlist)

# # My Tests Below

# stack = NumberStack.new
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

