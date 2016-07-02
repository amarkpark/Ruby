# 20160629 tree traversal notes
require 'byebug'

class Tree
  attr_accessor :payload, :children, :current, :child

  def initialize(payload, children)
    @payload = payload
    @children = children
  end
end

# def depth_first(node, matcher)
#   return node if node.payload == matcher
#     @stack = []
#     @found = []
#   while @found.include?(node) != true
#     # @stack = []
#     # @found = []
#     @found << node
#     @stack << node      
#     node = @stack[-1]
#     node.children.each do |child|
#       next if @found.include?(child)
#       depth_first(child)
#     end
#     return if @stack[-1] == nil
#     depth_first(@stack.pop)
#   end
# end

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
    stack << @current
  end
  # puts "Found list size: #{found.length}"
  # @current = stack[-1]
  # byebug
  if @current.children.any?
    @current.children.each do |child|
      # return child if child.payload == matcher
      next if found.include?(child) # checking for 'visited'
      # byebug
      depth_first_r(child, matcher, found, stack)
    end
  else
    stack.pop
  end
  # return @current if stack[-1] == nil
  return @current if stack.any? == false
  # stack.pop
  # byebug
  depth_first_r(stack.pop, matcher, found, stack)
end


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


p depth_first_r(trunk, 11, [], [])
# p depth_first_r(eleventh_node, 11, [], [])
# p depth_first_r(sixth_node, 11, [], [])