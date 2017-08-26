require 'byebug'

class Node
  attr_accessor :value, :next

  def initialize(value)
    self.value = value
  end
end

head = Node.new(3)
head.next = Node.new(7)
head.next.next = Node.new(1)
head.next.next.next = Node.new(2)
head.next.next.next.next = Node.new(3)
head.next.next.next.next.next = Node.new(5)
head.next.next.next.next.next.next = Node.new(5)

def unique(head)
  # process 3
  seen = {}
  seen[head.value] = true

  node = head

  while node.next
    prev = node
    node = node.next

    # it is a duplicate
    if seen[node.value]
      # delete the node
      prev.next = node.next
      node = prev
    end

    seen[node.value] = true
  end

  head
end

result = unique(head)

values = []
while result
  values.push result.value
  result = result.next
end

puts values.to_s

