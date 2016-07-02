# 20160629 tree traversal notes
require 'byebug'

class Tree
  attr_accessor :payload, :children, :current, :node

  def initialize(payload, children)
    @payload = payload
    @children = children
  end
end

# def depth_first_i(node, matcher)
#   @stack = []
#   @found = []
#   current = node
#   while @found.include?(current) != true
#     puts "Current Node: #{current.payload}"
#     @found << current
#     return current if current.payload == matcher
#     @stack = @stack + current.children.reverse    
#     return puts "No match" if @stack[-1] == nil
#     current = @stack.pop
#   end
# end

def depth_first_i(node, matcher)
  @stack = []
  @found = []
  while @found.include?(node) != true
    puts "Current Node: #{node.payload}"
    @found << node
    return node if node.payload == matcher
    @stack = @stack + node.children.reverse    
    return puts "No match" if @stack[-1] == nil
    node = @stack.pop
  end
end

# def depth_first_r(node, matcher, found, stack)
#   # byebug
#   @current = node
#   puts "Current Node: #{node.payload}"
#   return @current if @current.payload == matcher
#   if found.include?(node) != true # checking for 'visited'
#     found << node
#     stack << node
#   end
#   # puts "Found list size: #{found.length}"
#   # node = stack[-1]
#   # byebug
#   if node.children.any?
#     node.children.each do |child|
#       next if found.include?(child) # checking for 'visited'
#       # byebug
#       depth_first_r(child, matcher, found, stack)
#     end
#   end
#   # return node if stack[-1] == nil
#   return @current if stack.any? == false
#   # stack.pop
#   # byebug
#   depth_first_r(stack.pop, matcher, found, stack)
# end

# def depth_first_r(node, matcher, found, stack)
#   # byebug
#   @current = node
#   puts "Current Node: #{@current.payload}"
#   # byebug
#   if @current.payload == matcher
#     puts "Found it!"
#     return @current
#   elsif found.include?(@current) != true # checking for 'visited'
#     found << @current
#     stack << @current
#   end
#   # puts "Found list size: #{found.length}"
#   # @current = stack[-1]
#   # byebug
#   if @current.children.any?
#     @current.children.each do |child|
#       # return child if child.payload == matcher
#       next if found.include?(child) # checking for 'visited'
#       # byebug
#       depth_first_r(child, matcher, found, stack)
#     end
#   else
#     stack.pop
#   end
#   # return @current if stack[-1] == nil
#   return @current if stack.any? == false
#   # stack.pop
#   # byebug
#   depth_first_r(stack.pop, matcher, found, stack)
# end

# def depth_first_r(node, matcher, found, stack)
#   # byebug
#   @current = node
#   puts "Current Node: #{@current.payload}"
#   # byebug
#   if @current.payload == matcher
#     puts "Found it!"
#     return @current
#   elsif found.include?(@current) != true # checking for 'visited'
#     found << @current
#     stack << @current
#   end
#   # @current = stack[-1]
#   # byebug
#   if @current.children.any?
#     @current.children.each do |child|
#       next if found.include?(child) # checking for 'visited'
#       # if child.payload == matcher
#       #   found << child
#       #   stack << child
#       #   break
#       # end
#       # byebug
#       # depth_first_r(child, matcher, found, stack)
#       found << child
#       stack << child
#       break if child.payload == matcher 
#     end
#   # elsif @current == stack[-1]
#   #   stack.pop
#   end
#   return @current if stack.any? == false
#   @current = stack.pop
#   # byebug
#   depth_first_r(@current, matcher, found, stack)
# end

def depth_first_r(node, matcher, found, stack)
  # byebug
  @current = node
  puts "Current Node: #{@current.payload}"
  # byebug
  if @current.payload == matcher
    puts "Found it!"
    return @current
  elsif found.include?(@current) != true # checking for 'visited'
    found << @current
    stack = stack + @current.children.reverse
  end
  depth_first_r(stack.pop, matcher, found, stack)
end

# def depth_first_r(node, matcher, found, stack)
#   @current = node
#   return @current if @current.payload == matcher
#   if found.include?(@current) != true # checking for 'visited'
#     found << @current
#     stack = stack + @current.children.reverse
#   end
#   depth_first_r(stack.pop, matcher, found, stack)
# end

# def depth_first_r(node, matcher, found, stack)
#   return node if node.payload == matcher
#   if found.include?(node) != true # checking for 'visited'
#     found << node
#     stack = stack + node.children.reverse
#   end
#   depth_first_r(stack.pop, matcher, found, stack)
# end

#   # @current = stack[-1]
#   # byebug
#   if @current.children.any?
#     @current.children.each do |child|
#       next if found.include?(child) # checking for 'visited'
#       # if child.payload == matcher
#       #   found << child
#       #   stack << child
#       #   break
#       # end
#       # byebug
#       # depth_first_r(child, matcher, found, stack)
#       found << child
#       stack << child
#       break if child.payload == matcher 
#     end
#   # elsif @current == stack[-1]
#   #   stack.pop
#   end
#   return @current if stack.any? == false
#   @current = stack.pop
#   # byebug
#   depth_first_r(@current, matcher, found, stack)
# end


# The "Leaves" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])


# p depth_first_r(trunk, 11, [], [])
# p depth_first_r(eleventh_node, 11, [], [])
# p depth_first_r(sixth_node, 11, [], [])
# p depth_first_r(trunk, 9, [], [])

p depth_first_i(trunk, 11)
# p depth_first_i(eleventh_node, 11)
# p depth_first_i(sixth_node, 11)
p depth_first_i(trunk, 9)