require 'byebug'

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    self.value = value
  end
end

head = Node.new(0)
head.left = Node.new(1)
head.right = Node.new(2)
head.left.left = Node.new(3)
head.left.right = Node.new(4)
head.right.left = Node.new(5)
head.right.right = Node.new(6)

class Stack
  def initialize
    @tape = []
  end

  def push(value)
    @tape.push(value)
  end

  def pop
    @tape.pop
  end

  def count
    @tape.length
  end
end

# depth first binary search
def dsearch(node)
  stack = Stack.new

  stack.push(node)

  while stack.count > 0
    this_node = stack.pop
    puts this_node.value

    if this_node.right
      stack.push(this_node.right)
    end

    if this_node.left
      stack.push(this_node.left)
    end
  end
end

dsearch(head)
