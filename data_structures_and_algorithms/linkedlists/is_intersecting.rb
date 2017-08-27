class Node
  attr_accessor :value, :next

  def initialize(value)
    self.value = value
  end
end

c = Node.new('c')

head = Node.new('a')
head.next = Node.new('b')
head.next.next = c
head.next.next.next = Node.new('d')
head.next.next.next.next = Node.new('e')

head2 = Node.new('z')
head2.next = Node.new('x')
head2.next.next = c

def is_intersecting(head, head2)
  visited = {}

  while head
    visited[head.object_id] = true

    head = head.next
  end

  while head2
    if visited[head2.object_id]
      return true
      break
    end

    head2 = head2.next
  end

  return false
end

puts is_intersecting(head, head2)
