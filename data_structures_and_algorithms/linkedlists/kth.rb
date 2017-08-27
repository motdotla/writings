require 'byebug'

# find kth element
class PrintLinkedListValues
  def initialize(node)
    @node = node
  end

  def run
    values = []

    values.push(@node.value)

    while @node = @node.next
      values.push @node.value
    end

    values
  end
end

class Node
  attr_accessor :value, :next

  def initialize(value)
    self.value = value
  end
end

head = Node.new(1)
head.next = Node.new(2)
head.next.next = Node.new(3)
head.next.next.next = Node.new(4)
head.next.next.next.next = Node.new(5)
head.next.next.next.next.next = Node.new(6)

def kth(head, k)
  return head if k == 0

  i = 0
  loop do
    head = head.next
    i += 1

    break if i >= k
  end

  head
end

kth_node = kth(head, 5)

puts PrintLinkedListValues.new(kth_node).run.to_s
