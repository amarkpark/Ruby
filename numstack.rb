# numstack.rb

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