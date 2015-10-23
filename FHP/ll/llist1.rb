# 20151022 Linked List #1 llist1.rb

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

# node1 = LinkedListNode.new(37)
# node2 = LinkedListNode.new(99, node1)
# node3 = LinkedListNode.new(12, node2)
 
# node3.print_values(node3)

# puts "-------"

# revlist = reverse_list(node3)

# print_values(revlist)

# My Tests Below

stack = NumberStack.new
stack.push(333)
stack.push(22)
stack.push(1)
stack.push(13)
stack.push(3462)
puts stack.inspect
puts stack.pop
puts stack.pop
puts stack.pop
puts stack.pop
puts stack.pop
puts stack.data