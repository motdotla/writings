class Print
  def initialize(head)
    @head = head
  end

  def run
    values = []

    node = @head

    values.push(node.value)

    while node = node.next
      values.push(node.value)
    end

    values
  end
end

class Node
  attr_accessor :next, :value

  def initialize(value = nil)
    self.value = value
  end
end

head = Node.new(3)
head.next = Node.new(5)
head.next.next = Node.new(8)
head.next.next.next = Node.new(5)
head.next.next.next.next = Node.new(10)
head.next.next.next.next.next = Node.new(2)
head.next.next.next.next.next.next = Node.new(1)
head.next.next.next.next.next.next.next = Node.new(4)
head.next.next.next.next.next.next.next.next = Node.new(9)

class Stack
  def initialize
    @values = []
  end

  def push(value)
    @values.push(value)
  end

  def pop
    @values.pop
  end
end

def partition(node, x)
  left = Stack.new
  right = Stack.new

  # put them in their separate partitions using a stack
  while node
    if node.value < x
      left.push(node.value)
    else
      right.push(node.value)
    end

    node = node.next
  end

  # now we have a left stack and a right stack, let's build the new list
  value = left.pop
  head = Node.new(value)
  last = head

  while value = left.pop
    last.next = Node.new(value)

    last = last.next
  end

  while value = right.pop
    last.next = Node.new(value)

    last = last.next
  end

  head
end

result = partition(head, 5)
puts Print.new(result).run.to_s
