# depthfirst.rb 20160702
require 'benchmark'

class Tree
  attr_accessor :payload, :children, :current, :node

  def initialize(payload, children)
    @payload = payload
    @children = children
  end
end

def depth_first_i(node, matcher)
  @stack = []
  @found = []
  while @found.include?(node) != true
    # puts "Current Node: #{node.payload}" # uncomment to show progress
    @found << node
    return node if node.payload == matcher
    @stack = @stack + node.children.reverse    
    return puts "No match" if @stack[-1] == nil
    node = @stack.pop
  end
end

def depth_first_r(node, matcher, found, stack)
  # puts "Current Node: #{node.payload}"  # uncomment to show progress
  return node if node.payload == matcher
  if found.include?(node) != true # checking for 'visited'
    found << node
    stack = stack + node.children.reverse
  end
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

Benchmark.bm do |x|
  x.report("iterative_1") { depth_first_i(trunk, 11) }
  x.report("iterative_2") { depth_first_i(trunk, 9) }
  x.report("recursive_1") { depth_first_r(trunk, 11, [], []) }
  x.report("recursive_2") { depth_first_r(trunk, 9, [], []) }
end

# Results
# [Web Dev]:  /vagrant/src/ruby/fhp/trees $ ruby depthfirst.rb
#        user     system      total        real
# iterative_1  0.000000   0.000000   0.000000 (  0.000016)
# iterative_2  0.000000   0.000000   0.000000 (  0.000079)
# recursive_1  0.000000   0.000000   0.000000 (  0.000008)
# recursive_2  0.000000   0.000000   0.000000 (  0.000026)
# [Web Dev]:  /vagrant/src/ruby/fhp/trees $ 
