# 20160620 Linked List #2 Tortoise and Hare llist2.2.rb
require 'byebug'


class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def findloop(list_node)
  tnode = list_node.next_node
  hnode = tnode.next_node
  until tnode.value == hnode.value do
    2.times do 
      hnode = hnode.next_node
      return puts "No loop found" if hnode == nil
    end
    tnode = tnode.next_node
  end
  puts "Loop found"
  tnode = tnode.next_node
  count = 1
  until tnode.value == hnode.value do
    tnode = tnode.next_node
    count += 1
  end
  puts "Loop contains #{count} nodes."
  return
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(84, node3)
node5 = LinkedListNode.new(16, node4)
node6 = LinkedListNode.new(25, node5)
node7 = LinkedListNode.new(183, node6)
node1.next_node = node6


findloop(node7)
