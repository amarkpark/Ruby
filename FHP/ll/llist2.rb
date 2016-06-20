# 20160620 Linked List #2 llist2.rb
require 'byebug'


class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def revlist2(list_node, previous_node=nil)
  @rev_node = LinkedListNode.new(list_node.value, previous_node)
  if list_node.next_node.nil?
    return @rev_node
  else
    list_node = list_node.next_node
    revlist2(list_node, @rev_node)
  end
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
# byebug 
revlist = revlist2(node4)

print_values(revlist)
