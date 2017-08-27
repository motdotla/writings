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

def partition(node, x)
  head = node
  tail = node

  while node
    nxt = node.next

    if node.value < x 
      node.next = head
      head = node
    else
      tail.next = node
      tail = node
    end

    node = nxt
  end

  head
end

result = partition(head, 5)
puts Print.new(result).run.to_s
