class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    self.value = value
  end
end

class Queue
  def initialize
    @tape = []
  end

  def enqueue(value)
    @tape.push(value)
  end

  def dequeue
    @tape.shift
  end

  def count
    @tape.length
  end
end

def breadth_first_search(node)
  q = Queue.new

  q.enqueue(node)

  while q.count > 0
    this_node = q.dequeue

    puts this_node.value

    if this_node.left
      q.enqueue(this_node.left)
    end

    if this_node.right
      q.enqueue(this_node.right)
    end
  end
end

head = Node.new(0)
head.left = Node.new(1)
head.right = Node.new(2)
head.left.left = Node.new(3)
head.left.right = Node.new(4)
head.right.left = Node.new(5)
head.right.right = Node.new(6)

breadth_first_search(head)
